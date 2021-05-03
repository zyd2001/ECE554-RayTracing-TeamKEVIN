using System.Collections.Generic;
using System.Collections.Immutable;
using Set = System.Collections.Immutable.ImmutableHashSet<string>;
using Move = System.ValueTuple<int, int>;
using System.Linq;
using System.Text;
using System;

namespace CompilerCore
{
    class InferenceGraph
    {
        internal Dictionary<string, int> Map { get; } = new Dictionary<string, int>();
        internal List<string> ReverseMap { get; } = new List<string>();

        internal ImmutableHashSet<int>[] AdjacentList { get; set; } = null;
        internal ImmutableHashSet<int>.Builder[] AdjacentListBuilder { get; } = null;
        internal bool[,] AdjacentMatrix { get; } = null;
        // internal Dictionary<Move, int> MoveMap { get; } = new Dictionary<Move, int>();
        // internal List<Move> ReverseMoveMap { get; } = new List<Move>();
        internal HashSet<Move>[] MoveList = null;
        internal HashSet<Move> WorklistMoves = new HashSet<Move>();
        internal int[] Degree = null;

        public InferenceGraph(List<Set> ins, List<Set> outs, HashSet<string> precolored)
        {
            for (int i = 0; i < ins.Count; i++)
            {
                foreach (var item in ins[i])
                {
                    if (Map.TryAdd(item, ReverseMap.Count))
                        ReverseMap.Add(item);
                }
                foreach (var item in outs[i])
                {
                    if (Map.TryAdd(item, ReverseMap.Count))
                        ReverseMap.Add(item);
                }
            }

            foreach (var item in precolored)
                if (Map.TryAdd(item, ReverseMap.Count))
                    ReverseMap.Add(item);

            AdjacentListBuilder = Enumerable.Range(0, ReverseMap.Count).Select((i) => ImmutableHashSet.CreateBuilder<int>()).ToArray();
            AdjacentList = new ImmutableHashSet<int>[ReverseMap.Count];
            AdjacentMatrix = new bool[ReverseMap.Count, ReverseMap.Count];
            MoveList = Enumerable.Range(0, ReverseMap.Count).Select((i) => new HashSet<Move>()).ToArray();
            Degree = new int[ReverseMap.Count];
        }
        internal void AddEdgeP(string a, string b, bool aa, bool bb)
        {
            int ia = Map[a];
            int ib = Map[b];
            AddEdgeP(ia, ib, aa, bb);
        }
        internal void AddEdgeP(int a, int b, bool aa, bool bb)
        {
            AdjacentMatrix[a, b] = true;
            AdjacentMatrix[b, a] = true;
            if (!aa)
            {
                Degree[a]++;
                AdjacentListBuilder[a].Add(b);
            }
            if (!bb)
            {
                Degree[b]++;
                AdjacentListBuilder[b].Add(a);
            }
        }
        internal void AddEdge(string a, string b)
        {
            int ia = Map[a];
            int ib = Map[b];
            AddEdge(ia, ib);
        }
        internal void AddEdge(int a, int b)
        {
            Degree[a]++;
            AdjacentListBuilder[a].Add(b);
            AdjacentMatrix[a, b] = true;
            Degree[b]++;
            AdjacentMatrix[b, a] = true;
            AdjacentListBuilder[b].Add(a);
        }

        public override string ToString()
        {
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < AdjacentList.Length; i++)
            {
                builder.AppendLine(ReverseMap[i]);
                foreach (var item in AdjacentListBuilder[i])
                    builder.AppendLine($"{ReverseMap[i]} {ReverseMap[item]}");
            }
            return builder.ToString();
        }

        static T getFirstInSet<T>(ISet<T> set)
        {
            var e = set.GetEnumerator();
            e.MoveNext();
            return e.Current;
        }

        internal void AddToMoveList(string item, Set Def, Set Use)
        {
            if (Def.Count != 1 || Use.Count != 1)
                throw new Exception("fv<k");
            // if (Map.ContainsKey(getFirstInSet(Def))) 
            // {
            int u = Map[getFirstInSet(Def)];
            int v = Map[getFirstInSet(Use)];
            MoveList[Map[item]].Add((u, v));
            // }
        }

        internal void AddToWorklistMoves(Set Def, Set Use)
        {
            if (Def.Count != 1 || Use.Count != 1)
                throw new Exception("fv<k");
            // if (Map.ContainsKey(getFirstInSet(Def)))
            // {
            int u = Map[getFirstInSet(Def)];
            int v = Map[getFirstInSet(Use)];
            WorklistMoves.Add((u, v));
            // }
        }
    }

}