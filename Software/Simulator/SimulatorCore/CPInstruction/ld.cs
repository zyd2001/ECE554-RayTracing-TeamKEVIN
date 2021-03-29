using System.Runtime.InteropServices;

namespace SimulatorCore
{
    class ld : CPInstruction
    {
        int r0, r1, imm;

        internal ld(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void process(RegisterFile<int> RF, Memory mem)
        {
            RF[r0] = MemoryMarshal.Read<int>(mem.read(RF[r1] + imm));


        }
    }


}