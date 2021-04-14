namespace SimulatorCore
{
    abstract class CPInstruction : IInstruction
    {
        internal abstract void Process(RegisterFile<int> RF, Memory mem);
    }
}