using System;
using System.Collections.Generic;

namespace SimulatorCore
{
    public class RegisterFile<T>
    {
        public T[] Array { get; }
        public LinkedList<(int id, T before, T after)> TraceLog { get; }
        bool trace;
        public RegisterFile(int size)
        {
            Array = new T[size];
            trace = false;
            TraceLog = new LinkedList<(int id, T before, T after)>();
        }

        public T this[int i]
        {
            get => Array[i];
            set
            {
                if (trace)
                    TraceLog.AddLast((i, Array[i], value));
                Array[i] = value;
            }
        }

        public void StartTrace()
        {
            trace = true;
            TraceLog.Clear();
        }

        public void EndTrace()
        {
            trace = false;
        }
    }
}