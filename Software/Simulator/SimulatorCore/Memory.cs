using System;
using System.IO;

namespace SimulatorCore
{
    public class Memory
    {
        public byte[] Mem {get;}

        public Memory(int size)
        {
            Mem = new byte[size];
        }

        public void loadToMemory(FileStream binaryFile)
        {
            binaryFile.Read(new Span<byte>(Mem, 0, (int) binaryFile.Length));
        }

        public void write(int address, byte[] data)
        {
            Array.Copy(data, 0, Mem, address, 4);
        }

        public ReadOnlySpan<byte> read(int address)
        {
            return new ReadOnlySpan<byte>(Mem, address, 4);
        }
    }
}