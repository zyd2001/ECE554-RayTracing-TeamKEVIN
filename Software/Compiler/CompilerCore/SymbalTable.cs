using System.Collections.Generic;

namespace CompilerCore
{
    class Symbol
    {
        internal Type Type { get; }
        internal string Identifier { get; }
        internal bool IsFunction { get; }
        internal FunctionDefinitionStatement FunctionDefinition { get; }
        internal List<Type> ParametersType { get; }
        internal Symbol(Type type, string id, bool func = false, List<Type> types = null,
            FunctionDefinitionStatement function = null)
        {
            Type = type;
            Identifier = id;
            IsFunction = func;
            ParametersType = types;
            FunctionDefinition = function;
        }
    }

    class SymbolTable
    {
        List<Dictionary<string, Symbol>> scopes;
        internal Dictionary<string, Symbol> LocalScope { get => scopes[^1]; }
        internal int ScopeLevel { get => scopes.Count; }
        internal SymbolTable()
        {
            scopes = new List<Dictionary<string, Symbol>> { new Dictionary<string, Symbol>() };
        }

        internal void AddScope()
        {
            scopes.Add(new Dictionary<string, Symbol>());
        }

        internal void RemoveScope()
        {
            scopes.RemoveAt(scopes.Count - 1);
        }

        internal Symbol GlobalSearch(string id)
        {
            for (int i = scopes.Count - 1; i >= 0; i--)
            {
                Symbol symbol;
                if (scopes[i].TryGetValue(id, out symbol))
                    return symbol;
            }
            return null;
        }

        internal Symbol LocalSearch(string id)
        {
            Symbol symbol;
            if (scopes[^1].TryGetValue(id, out symbol))
                return symbol;
            else
                return null;
        }

        internal void AddSymbol(string id, Symbol symbol)
        {
            scopes[^1][id] = symbol;
        }
    }
}