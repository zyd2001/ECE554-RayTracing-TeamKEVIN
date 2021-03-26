namespace SimulatorCore
{
    public class CommandProcessor
    {
        public Memory memory;
        public RegisterFile<int> registerFile;
        public RayTracing rayTracingUnit;

        public CommandProcessor(Memory mem, RayTracing RT)
        {
            registerFile = new RegisterFile<int>(16);
            rayTracingUnit = RT;
            memory = mem;
        }

        public void step()
        {

        }

        public void runUntil(int address)
        {

        }

        public void run()
        {

        }
    }
}