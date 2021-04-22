using System.Collections.Generic;

namespace CompilerCore
{
    class Symbol
    {
        internal Type Type { get; }
        internal string Identifier { get; }
        internal bool IsFunction { get; }
        internal List<Type> ParametersType { get; }
        internal Symbol(Type type, string id, bool func = false, List<Type> types = null)
        {
            Type = type;
            Identifier = id;
            IsFunction = func;
            ParametersType = types;
        }
    }

    class SymbolTable
    {
        List<Dictionary<string, Symbol>> scopes;
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

        internal void AddSymbol(Symbol symbol)
        {
            scopes[^1][symbol.Identifier] = symbol;
        }
    }
}