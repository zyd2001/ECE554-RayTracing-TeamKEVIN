namespace SimulatorCore
{
    class launch : CPInstruction
    {
        internal int r0; // needs to read this 

        internal launch(int r0)
        {
            this.r0 = r0;
        }

        internal override void process(RegisterFile<int> RF, Memory mem)
        {

        }

        public override string ToString()
        {
            return "launch r" + r0;
        }
    }
}