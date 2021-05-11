using System;
using System.CommandLine.DragonFruit;
using System.IO;
using System.Numerics;
using SimulatorCore;

namespace SimulatorCLI
{
    class Program
    {
        /// <summary>
        /// Simulator Command Line Interface
        /// </summary>
        /// <param name="w">Width</param>
        /// <param name="h">height</param>
        /// <param name="RT">The path to RT Core software binary file</param>
        /// <param name="DT">Disable the trace output</param>
        /// <param name="constant">Constant file path</param>
        /// <param name="RTMSize">RT Core main memory size (in byte)</param>
        /// <param name="Triangle">Traingle binary file</param>
        /// <param name="RTO">RT Trace Output file (Fallback will be Console)</param>
        /// <param name="single">Run a single pixel (0 for all pixels)</param>
        static void Main(int w, int h, FileInfo RT = null, bool DT = false, int RTMSize = 65536,
            FileInfo Triangle = null, FileInfo RTO = null,
            FileInfo outFile = null, FileInfo constant = null, int single = 0)
        {
            if (RT == null)
            {
                Console.WriteLine("Must specify one binary file path for RT or CP");
                return;
            }
            if (outFile is null)
                outFile = new FileInfo("output.ppm");
            if (constant is null)
                constant = new FileInfo("constant.dat.out");
            if (Triangle is null)
                Triangle = new FileInfo("box.obj.out");
            var writer = outFile.CreateText();
            writer.WriteLine($"P3\n{w} {h}\n255");
            Simulator sim = new Simulator(null, RT, constant, DT, 0, RTMSize, Triangle, null, RTO);
            if (single != 0)
            {
                sim.RunRT(single);
            }
            else
            {
                for (int i = 0; i < w * h; i++)
                {
                    var color = sim.RunRT(i);
                    int r, g, b;
                    r = (int)(color.r * 255);
                    g = (int)(color.g * 255);
                    b = (int)(color.b * 255);
                    writer.Write($"{r} {g} {b}\n");
                }
            }
            writer.Close();

        }
    }
}
