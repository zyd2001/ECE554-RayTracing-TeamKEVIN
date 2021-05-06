using System;
using System.IO;
using System.Collections.Generic;

namespace SimulatorCore
{
    public class Memory
    {
        public byte[] Mem { get; }
        public byte[] ConstantMem { get; }
        public LinkedList<(int address, int before, int after)> TraceLog { get; }
        bool trace;
        public Memory(int size)
        {
            Mem = new byte[size];
            trace = false;
            TraceLog = new LinkedList<(int address, int before, int after)>();
        }
        public Memory(int size, int csize)
        {
            Mem = new byte[size];
            ConstantMem = new byte[csize];
            trace = false;
            TraceLog = new LinkedList<(int address, int before, int after)>();
        }

        public void LoadToMemory(FileStream binaryFile)
        {
            binaryFile.Read(new Span<byte>(Mem, 0, (int)binaryFile.Length));
        }

        public void LoadToMemory(FileStream constantFile, bool p)
        {
            constantFile.Read(new Span<byte>(ConstantMem, 0, (int)constantFile.Length));
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
        public ReadOnlySpan<byte> Read(int address, bool p)
        {
            return new ReadOnlySpan<byte>(ConstantMem, address & (0x0fffffff), 4);
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

        internal (float r, float g, float b, float w) getLast()
        {
            int index = Mem.Length - 16;
            float a = BitConverter.ToSingle(Read(index));
            index += 4;
            float b = BitConverter.ToSingle(Read(index));
            index += 4;
            float c = BitConverter.ToSingle(Read(index));
            index += 4;
            float d = BitConverter.ToSingle(Read(index));
            return (a, b, c, d);
        }
    }
}