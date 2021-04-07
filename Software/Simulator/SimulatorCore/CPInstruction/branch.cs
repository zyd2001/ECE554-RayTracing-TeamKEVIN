namespace SimulatorCore
{
    class bz : CPInstruction
    {
        int rd, imm;

        internal bz(int rd, int imm)
        {
            this.rd = rd;
            this.imm = imm;
        }

        internal override void process(RegisterFile<int> RF, Memory mem)
        {
            if (RF[rd] == 0)
            {
                RF[15] = imm; // 17th reg of a reg file representing the CP PC
                              // In the hardware, the PC will not actually
                              // be in the main reg file
            }
        }

        public override string ToString()
        {
            return "bz r" + rd + " " + imm;
        }
    }

    class bnz : CPInstruction
    {
        int rd, imm;

        internal bnz(int rd, int imm)
        {
            this.rd = rd;
            this.imm = imm;
        }

        internal override void process(RegisterFile<int> RF, Memory mem)
        {
            if (RF[rd] != 0)
            {
                RF[15] = RF[15] + imm;
            }
        }

        public override string ToString()
        {
            return "bnz r" + rd + " " + imm;
        }
    }

    class bge : CPInstruction
    {
        int rd, imm;

        internal bge(int rd, int imm)
        {
            this.rd = rd;
            this.imm = imm;
        }

        internal override void process(RegisterFile<int> RF, Memory mem)
        {
            if (RF[rd] >= 0)
            {
                RF[15] = imm;
            }
        }

        public override string ToString()
        {
            return "bge r" + rd + " " + imm;
        }
    }

    class ble : CPInstruction
    {
        int rd, imm;

        internal ble(int rd, int imm)
        {
            this.rd = rd;
            this.imm = imm;
        }

        internal override void process(RegisterFile<int> RF, Memory mem)
        {
            if (RF[rd] <= 0)
            {
                RF[15] = imm;
            }
        }

        public override string ToString()
        {
            return "ble r" + rd + " " + imm;
        }
    }

}