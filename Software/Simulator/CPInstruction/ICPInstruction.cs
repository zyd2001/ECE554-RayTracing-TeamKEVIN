namespace Simulator
{
    interface ICPInstruction
    {
        void process(RegisterFile<int> RF, Memory mem);
    }
}