using System;
using System.CommandLine.DragonFruit;
using System.IO;

namespace SimulatorCLI
{
    class Program
    {
        /// <summary>
        /// Simulator Command Line Interface
        /// </summary>
        /// <param name="CP">The path to CP software binary file</param>
        /// <param name="RT">The path to RT Core software binary file</param>
        /// <param name="DT">Disable the trace output</param>
        /// <param name="CPMSize">CP memory size (in byte)</param>
        /// <param name="RTMSize">RT Core main memory size (in byte)</param>
        /// <param name="Triangle">Traingle binary file</param>
        /// <param name="RTO">RT Trace Output file (Fallback will be Console)</param>
        /// <param name="CPO">CP Trace Output file (Fallback will be Console)</param>
        static void Main(FileInfo CP = null, FileInfo RT = null, bool DT = false, int CPMSize = 4096, int RTMSize = 4194304,
            FileInfo Triangle = null, FileInfo RTO = null, FileInfo CPO = null)
        {
            if (CP == null && RT == null)
            {
                Console.WriteLine("Must specify one binary file path for RT or CP");
                return;
            }
            Simulator sim = new Simulator(CP, RT, DT, CPMSize, RTMSize, Triangle, CPO, RTO);
            if (CP != null)
                sim.run();
            else
                sim.runRT(0);
        }

    }
}
