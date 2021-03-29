using System;
using System.IO;

namespace SimulatorCore
{
    public class Memory
    {
        byte[] mem { get; }

        public Memory(int size)
        {
            mem = new byte[size];
        }

        public void loadToMemory(FileStream binaryFile)
        {
            binaryFile.Read(new Span<byte>(mem, 0, (int)binaryFile.Length));
        }

        public void write(int address, byte[] data)
        {
            Array.Copy(data, 0, mem, address, 4);
        }

        public ReadOnlySpan<byte> read(int address)
        {
            return new ReadOnlySpan<byte>(mem, address, 4);
        }
    }
}