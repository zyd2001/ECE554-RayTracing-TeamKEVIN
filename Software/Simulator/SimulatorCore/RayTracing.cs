namespace SimulatorCore
{
    public class RayTracing
    {
        RTCore core;
        public RayTracing(Memory mem, Memory triangleMem)
        {
            core = new RTCore(mem, triangleMem);
        }

        public void start(int[] pixels, int[] baseAddresses)
        {

        }
    }
}