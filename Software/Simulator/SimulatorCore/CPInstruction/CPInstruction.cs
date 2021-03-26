namespace SimulatorCore
{
    abstract class CPInstruction : IInstruction
    {
        internal abstract void process(RegisterFile<int> RF, Memory mem);
    }
}