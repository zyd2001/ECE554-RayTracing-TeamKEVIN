namespace SimulatorCore
{
    abstract class CPInstruction
    {
        internal abstract void process(RegisterFile<int> RF, Memory mem);
    }
}