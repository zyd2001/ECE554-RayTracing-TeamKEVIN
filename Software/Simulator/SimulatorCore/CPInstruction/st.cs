using System;

namespace SimulatorCore
{
    class st : CPInstruction
    {
        int r0, r1, imm;

        internal st(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void process(RegisterFile<int> RF, Memory mem)
        {

            var bytes = BitConverter.GetBytes(RF[r0]);
            mem.write(RF[r1] + imm, bytes);


        }
    }


}