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

        internal override void Process(RegisterFile<int> RF, Memory mem)
        {

            var bytes = BitConverter.GetBytes(RF[r0]);
            mem.Write(RF[r1] + imm, bytes);


        }

        public override string ToString()
        {
            return "st r" + r0 + " r" + r1 + " " + imm;
        }
    }


}