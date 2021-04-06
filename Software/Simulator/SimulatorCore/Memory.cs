using System;
using System.IO;
using System.Collections.Generic;

namespace SimulatorCore
{
    public class Memory
    {
        public byte[] Mem { get; }
        public LinkedList<(int address, int before, int after)> TraceLog { get; }
        bool trace;
        public Memory(int size)
        {
            Mem = new byte[size];
            trace = false;
            TraceLog = new LinkedList<(int address, int before, int after)>();
        }

        public void LoadToMemory(FileStream binaryFile)
        {
            binaryFile.Read(new Span<byte>(Mem, 0, (int)binaryFile.Length));
        }

        public void Write(int address, byte[] data)
        {
            if (trace)
                TraceLog.AddLast((address, BitConverter.ToInt32(Mem, address), BitConverter.ToInt32(data)));
            Array.Copy(data, 0, Mem, address, 4);
        }

        public ReadOnlySpan<byte> Read(int address)
        {
            return new ReadOnlySpan<byte>(Mem, address, 4);
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