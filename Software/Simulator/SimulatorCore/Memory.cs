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

        internal (float r, float g, float b) getLast()
        {
            int index = Mem.Length - 16;
            float a = BitConverter.ToSingle(Read(index));
            index += 4;
            float b = BitConverter.ToSingle(Read(index));
            index += 4;
            float c = BitConverter.ToSingle(Read(index));
            index += 4;
            return (a, b, c);
        }
    }
}