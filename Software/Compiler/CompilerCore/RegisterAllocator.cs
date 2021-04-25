using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using Move = System.ValueTuple<int, int>;

namespace CompilerCore
{
    class RegisterAllocator
    {
        InferenceGraph graph;
        HashSet<int> initial = new HashSet<int>();
        HashSet<int> precolored = new HashSet<int>();
        HashSet<int> simplifyWorklist = new HashSet<int>();
        HashSet<int> freezeWorklist = new HashSet<int>();
        HashSet<int> spillWorklist = new HashSet<int>();
        HashSet<int> spilledNodes = new HashSet<int>();
        HashSet<int> coloredNodes = new HashSet<int>();
        HashSet<int> coalescedNodes = new HashSet<int>();
        Stack<int> selectStack = new Stack<int>();
        HashSet<Move> coalescedMoves = new HashSet<Move>();
        HashSet<Move> constrainedMoves = new HashSet<Move>();
        HashSet<Move> frozenMoves = new HashSet<Move>();
        HashSet<Move> worklistMoves = new HashSet<Move>();
        HashSet<Move> activeMoves = new HashSet<Move>();
        HashSet<Move>[] moveList = null;
        HashSet<string> tempNodes = new HashSet<string>();
        Dictionary<int, int> alias = new Dictionary<int, int>();
        int[] color;
        int RegisterNumber;

        void makeWorklist()
        {
            foreach (int n in initial)
            {
                if (graph.Degree[n] >= RegisterNumber)
                    spillWorklist.Add(n);
                else if (moveRelated(n))
                    freezeWorklist.Add(n);
                else
                    simplifyWorklist.Add(n);
            }
        }

        HashSet<Move> nodeMoves(int n)
        {
            HashSet<Move> temp = new HashSet<Move>();
            temp.UnionWith(activeMoves);
            temp.UnionWith(worklistMoves);
            temp.IntersectWith(moveList[n]);
            return temp;
        }

        bool moveRelated(int n)
        {
            HashSet<Move> temp = nodeMoves(n);
            return temp.Count != 0;
        }


        ImmutableHashSet<int> adjacent(int n)
        {
            HashSet<int> temp = new HashSet<int>();
            temp.UnionWith(selectStack);
            temp.UnionWith(coalescedNodes);
            return graph.AdjacentList[n].Except(temp);
        }

        void simplify()
        {
            int n = getFirstInSet(simplifyWorklist);
            simplifyWorklist.Remove(n);
            selectStack.Push(n);
            foreach (var m in adjacent(n))
                decrementDegree(m);
        }

        void decrementDegree(int m)
        {
            int d = graph.Degree[m];
            graph.Degree[m] = d - 1;
            if (d == RegisterNumber)
            {
                enableMoves(m, adjacent(m));
            }
        }

        void enableMoves(int newNode, ImmutableHashSet<int> nodes)
        {
            foreach (var n in nodes)
                foreach (var m in nodeMoves(n))
                    if (activeMoves.Contains(m))
                    {
                        activeMoves.Remove(m);
                        worklistMoves.Add(m);
                    }
            enableMoves(newNode);
        }

        void enableMoves(int n)
        {
            foreach (var m in nodeMoves(n))
                if (activeMoves.Contains(m))
                {
                    activeMoves.Remove(m);
                    worklistMoves.Add(m);
                }
        }

        void coalesce()
        {
            var m = getFirstInSet(worklistMoves);
            worklistMoves.Remove(m);
            int x = getAlias(m.Item1);
            int y = getAlias(m.Item2);
            int u, v;
            if (precolored.Contains(y))
            {
                u = y;
                v = x;
            }
            else
            {
                u = x;
                v = y;
            }
            if (u == v)
            {
                coalescedMoves.Add(m);
                AddWorkList(u);
            }
            else if (precolored.Contains(v) || graph.AdjacentMatrix[u, v])
            {
                constrainedMoves.Add(m);
                AddWorkList(u);
                AddWorkList(v);
            }
            else if ((precolored.Contains(u) && ok(adjacent(v), u)) ||
                (!precolored.Contains(u) && conservative(adjacent(u).Union(adjacent(v)))))
            {
                coalescedMoves.Add(m);
                combine(u, v);
                AddWorkList(u);
            }
            else
                activeMoves.Add(m);
        }

        void combine(int u, int v)
        {
            if (freezeWorklist.Contains(v))
                freezeWorklist.Remove(v);
            else
                spillWorklist.Remove(v);
            coalescedNodes.Add(v);
            alias[v] = u;
            moveList[u].UnionWith(moveList[v]);
            enableMoves(v);
            foreach (var t in adjacent(v))
            {
                graph.AddEdge(t, u);
                for (int i = 0; i < graph.AdjacentListBuilder.Length; i++)
                    graph.AdjacentList[i] = graph.AdjacentListBuilder[i].ToImmutable();
                decrementDegree(t);
            }
            if (graph.Degree[u] >= RegisterNumber && freezeWorklist.Contains(u))
            {
                freezeWorklist.Remove(u);
                spillWorklist.Add(u);
            }
        }

        static T getFirstInSet<T>(IEnumerable<T> set)
        {
            var e = set.GetEnumerator();
            e.MoveNext();
            return e.Current;
        }

        int getAlias(int n)
        {
            if (coalescedNodes.Contains(n))
                return getAlias(alias[n]);
            else return n;
        }

        bool conservative(ImmutableHashSet<int> nodes)
        {
            int k = 0;
            foreach (var n in nodes)
                if (graph.Degree[n] < RegisterNumber)
                    k++;
            return k < RegisterNumber;
        }

        bool ok(ImmutableHashSet<int> adjacent, int r)
        {
            foreach (var t in adjacent)
                if (graph.Degree[t] >= RegisterNumber && !precolored.Contains(t) && !graph.AdjacentMatrix[t, r])
                    return false;
            return true;
        }

        void AddWorkList(int u)
        {
            if (precolored.Contains(u) && !moveRelated(u) && graph.Degree[u] < RegisterNumber)
            {
                freezeWorklist.Remove(u);
                simplifyWorklist.Add(u);
            }
        }

        void freeze()
        {
            int u = getFirstInSet(freezeWorklist);
            freezeWorklist.Remove(u);
            simplifyWorklist.Add(u);
            freezeMoves(u);
        }

        private void freezeMoves(int u)
        {
            foreach (var m in nodeMoves(u))
            {
                int v;
                if (getAlias(u) == getAlias(m.Item2))
                    v = getAlias(m.Item1);
                else
                    v = getAlias(m.Item2);
                activeMoves.Remove(m);
                frozenMoves.Add(m);
                if (nodeMoves(v).Count == 0 && graph.Degree[v] < RegisterNumber)
                {
                    freezeWorklist.Remove(v);
                    simplifyWorklist.Add(v);
                }
            }
        }

        void selectSpill()
        {
            // TODO: select
            foreach (var m in spillWorklist)
            {
                if (!tempNodes.Contains(graph.ReverseMap[m])) // temp nodes
                {
                    spillWorklist.Remove(m);
                    simplifyWorklist.Add(m);
                    freezeMoves(m);
                    break;
                }
            }
        }

        void assignColors()
        {
            while (selectStack.Count > 0)
            {
                int n = selectStack.Pop();
                var colors = Enumerable.Range(1, RegisterNumber).ToHashSet();
                foreach (var w in graph.AdjacentList[n])
                {
                    int a = getAlias(w);
                    if (coloredNodes.Contains(a) || precolored.Contains(a))
                        colors.Remove(color[a]);
                }
                if (colors.Count == 0)
                    spilledNodes.Add(n);
                else
                {
                    coloredNodes.Add(n);
                    color[n] = getFirstInSet(colors);
                }
            }
            foreach (var n in coalescedNodes)
                color[n] = color[getAlias(n)];
        }

        void rewrite(FunctionTranslation translation, bool scalar)
        {
            for (var node = translation.List.First; node != null; node = node.Next)
            {
                Assembly ins = node.Value;
                if (scalar)
                {
                    HashSet<int> defs = new HashSet<int>();
                    HashSet<int> uses = new HashSet<int>();
                    foreach (var item in ins.SDef)
                        if (ins.SDef.Overlaps(ins.SOut)) // if define is used
                            defs.Add(graph.Map[item]);
                    foreach (var item in ins.SUse)
                        uses.Add(graph.Map[item]);
                    if (spilledNodes.Overlaps(defs))
                    {
                        if (defs.Count > 1)
                            throw new Exception("fv<k");
                        var tempVar = ".S" + Statement.VariableCounter;
                        ins.SDef = (new HashSet<string> { tempVar }).ToImmutableHashSet();
                        tempNodes.Add(tempVar);
                        translation.List.AddAfter(node, new Assembly("s_store_4byte", new List<string> { tempVar, "RS28", "1" }));
                        node = node.Next;
                    }
                    uses.IntersectWith(spilledNodes);
                    foreach (var item in uses)
                    {
                        var tempVar = ".S" + Statement.VariableCounter;
                        ins.SUse = ins.SUse.Remove(graph.ReverseMap[item]).Add(tempVar);
                        tempNodes.Add(tempVar);
                        translation.List.AddBefore(node, new Assembly("s_load_4byte", new List<string> { tempVar, "RS28", "1" }));
                    }
                }
                else
                {
                    HashSet<int> defs = new HashSet<int>();
                    HashSet<int> uses = new HashSet<int>();
                    foreach (var item in ins.VDef)
                        if (ins.VDef.Overlaps(ins.VOut)) // if define is used
                            defs.Add(graph.Map[item]);
                    foreach (var item in ins.VUse)
                        uses.Add(graph.Map[item]);
                    if (spilledNodes.Overlaps(defs))
                    {
                        if (defs.Count > 1)
                            throw new Exception("fv<k");
                        var tempVar = ".V" + Statement.VariableCounter;
                        ins.VDef = (new HashSet<string> { tempVar }).ToImmutableHashSet();
                        tempNodes.Add(tempVar);
                        translation.List.AddAfter(node, new Assembly("v_store_4byte", new List<string> { tempVar, "RS28", "1" }));
                        node = node.Next;
                    }
                    uses.IntersectWith(spilledNodes);
                    foreach (var item in uses)
                    {
                        var tempVar = ".V" + Statement.VariableCounter;
                        ins.VUse = ins.VUse.Remove(graph.ReverseMap[item]).Add(tempVar);
                        tempNodes.Add(tempVar);
                        translation.List.AddBefore(node, new Assembly("v_load_4byte", new List<string> { tempVar, "RS28", "1" }));
                    }
                }
            }
        }

        internal static void fk(FunctionTranslation translation)
        {
            while (true)
            {
                HashSet<string> spre = new HashSet<string>();
                HashSet<string> vpre = new HashSet<string>();
                for (int i = 1; i < 28; i++)
                    spre.Add($"RS{i}");
                for (int i = 1; i < 16; i++)
                    spre.Add($"RV{i}");

                (var sgraph, var vgraph) = translation.CreateInferenceGraph(spre, vpre);

                HashSet<int> sPrecolored = new HashSet<int>();
                HashSet<int> vPrecolored = new HashSet<int>();

                for (int i = 1; i < 28; i++)
                    sPrecolored.Add(sgraph.Map[$"RS{i}"]);
                for (int i = 1; i < 16; i++)
                    vPrecolored.Add(sgraph.Map[$"RV{i}"]);

                // Console.WriteLine(sgraph.ToString());
                RegisterAllocator sAllocator = new RegisterAllocator(sgraph, 27, sPrecolored);
                RegisterAllocator vAllocator = new RegisterAllocator(vgraph, 15, vPrecolored);
                bool sDone = false, vDone = true;
                while (!sDone)
                    if (sAllocator.simplifyWorklist.Count != 0)
                        sAllocator.simplify();
                    else if (sAllocator.worklistMoves.Count != 0)
                        sAllocator.coalesce();
                    else if (sAllocator.freezeWorklist.Count != 0)
                        sAllocator.freeze();
                    else if (sAllocator.spillWorklist.Count != 0)
                        sAllocator.selectSpill();
                    else
                        break;
                // while (!vDone)
                //     if (vAllocator.simplifyWorklist.Count != 0)
                //         vAllocator.simplify();
                //     else if (vAllocator.worklistMoves.Count != 0)
                //         vAllocator.coalesce();
                //     else if (vAllocator.freezeWorklist.Count != 0)
                //         vAllocator.freeze();
                //     else if (vAllocator.spillWorklist.Count != 0)
                //         vAllocator.selectSpill();
                //     else
                //         break;
                sAllocator.assignColors();
                // vAllocator.assignColors();
                if (sAllocator.spilledNodes.Count == 0)
                    sDone = true;
                else
                    sAllocator.rewrite(translation, true);
                // if (vAllocator.spilledNodes.Count != 0)
                // {
                //     vAllocator.rewrite(translation);
                //     vDone = true;
                // }
                if (sDone && vDone)
                    break;
            }
        }

        internal RegisterAllocator(InferenceGraph graph, int number, HashSet<int> pre)
        {
            RegisterNumber = number;
            this.graph = graph;
            precolored = pre;
            color = new int[graph.Map.Count];
            initial = new HashSet<int>(graph.Map.Values);
            moveList = graph.MoveList;
            worklistMoves = graph.WorklistMoves;
            for (int i = 0; i < graph.AdjacentListBuilder.Length; i++)
                graph.AdjacentList[i] = graph.AdjacentListBuilder[i].ToImmutable();
            makeWorklist();
        }
    }
}