namespace SimulatorCore
{
    class sub : CPInstruction
    {
        int r0, r1, r2;

        internal sub(int r0, int r1, int r2)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.r2 = r2;
        }

        internal override void process(RegisterFile<int> RF, Memory mem)
        {
            RF[r0] = RF[r1] - RF[r2];
        }

        public override string ToString()
        {
            return "sub r" + r0 + " r" + r1 + " r" + r2;
        }
    }

    class subi : CPInstruction
    {
        int r0, r1, imm;

        internal subi(int r0, int r1, int imm)
        {
            this.r0 = r0;
            this.r1 = r1;
            this.imm = imm;
        }

        internal override void process(RegisterFile<int> RF, Memory mem)
        {
            RF[r0] = RF[r1] - imm;
        }

        public override string ToString()
        {
            return "subi r" + r0 + " r" + r1 + " " + imm;
        }
    }
}