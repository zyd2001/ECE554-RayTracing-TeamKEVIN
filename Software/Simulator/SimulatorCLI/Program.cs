using System;
using SimulatorCore;
using System.Threading.Tasks;
using System.Threading;

namespace SimulatorCLI
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] data = new int[64];
            CommandProcessor CP = new CommandProcessor(new Memory(123));
            RayTracing RT = new RayTracing(new Memory(100), new Memory(100));
            EventWaitHandle canLaunch = new AutoResetEvent(true);
            EventWaitHandle output = new AutoResetEvent(false);
            Task CPTask = Task.Run(() =>
            {
                while (true)
                    if (CP.StepConcurrent(data, canLaunch, output))
                        break;
                output.Set();
            });
            while (true)
            {
                output.WaitOne();
                if (CPTask.IsCompleted)
                    break;
                for (int i = 0; i < data.Length; i++)
                {
                    RT.ScalarRegisterFile[30] = 0 + RT.Memory.Mem.Length / 64 * i; // set Stack Pointer
                    RT.ScalarRegisterFile[31] = 0; // set PC
                    while (true)
                        if (RT.Step())
                            break;
                }
                canLaunch.Set();
            }
        }
    }
}
