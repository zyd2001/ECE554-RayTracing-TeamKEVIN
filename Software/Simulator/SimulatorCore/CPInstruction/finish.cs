namespace SimulatorCore
{
    class finish : CPInstruction
    {
        internal finish()
        {
        }
        internal override void process(RegisterFile<int> RF, Memory mem)
        {
        }
        public override string ToString()
        {
            return "finish";
        }
    }
}