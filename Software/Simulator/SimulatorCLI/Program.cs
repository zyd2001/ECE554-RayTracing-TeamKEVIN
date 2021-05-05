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
        /// <param name="CP">The path to CP software binary file</param>
        /// <param name="RT">The path to RT Core software binary file</param>
        /// <param name="DT">Disable the trace output</param>
        /// <param name="CPMSize">CP memory size (in byte)</param>
        /// <param name="RTMSize">RT Core main memory size (in byte)</param>
        /// <param name="Triangle">Traingle binary file</param>
        /// <param name="RTO">RT Trace Output file (Fallback will be Console)</param>
        /// <param name="CPO">CP Trace Output file (Fallback will be Console)</param>
        static void Main(FileInfo CP = null, FileInfo RT = null, bool DT = false, int CPMSize = 4096, int RTMSize = 65536,
            FileInfo Triangle = null, FileInfo RTO = null, FileInfo CPO = null)
        {
            if (CP == null && RT == null)
            {
                Console.WriteLine("Must specify one binary file path for RT or CP");
                return;
            }
            FileInfo outFile = new FileInfo("output.ppm");
            var writer = outFile.CreateText();
            writer.WriteLine($"P3\n{320} {180}\n255");
            FileInfo file = new FileInfo("triangle.obj.out");
            Simulator sim = new Simulator(CP, RT, true, CPMSize, RTMSize, file, CPO, RTO);
            if (CP != null)
                sim.Run();
            else
                // sim.RunRT(160 * 180);
                for (int i = 0; i < 320 * 180; i++)
                {
                    var color = sim.RunRT(i);
                    int r, g, b;
                    r = (int)(color.r * 255);
                    g = (int)(color.g * 255);
                    b = (int)(color.b * 255);
                    writer.Write($"{r} {g} {b}\n");
                }
            writer.Close();
            //     FileInfo file = new FileInfo("triangle.obj.out");
            //     FileInfo outFile = new FileInfo("output.ppm");
            //     var writer = outFile.CreateText();
            //     IntersectionCore IC = new IntersectionCore(file.OpenText());
            //     float scale = 0.57735F;
            //     int width = 320;
            //     int height = 180;
            //     float imageAspectRatio = width / (float)height;
            //     int k = 0;
            //     writer.WriteLine($"P3\n{width} {height}\n255");
            //     for (int j = 0; j < height; j++)
            //         for (int i = 0; i < width; i++)
            //         {
            //             // int i = 80;
            //             // int j = 45;
            //             float x = (float)(2 * (i + 0.5) / width - 1) * imageAspectRatio * scale;
            //             float y = (float)(1 - 2 * (j + 0.5) / height) * scale;
            //             Vector3 dir = new Vector3(x, y, -1);
            //             Vector4 ori4 = new Vector4(0, 0, 6, 0);
            //             Vector4 direction = new Vector4(Vector3.Normalize(dir), 0);
            //             var result = IC.Process(ori4, direction);
            //             if (result.point.W != 0)
            //             {
            //                 writer.WriteLine("0 255 255");
            //             }
            //             else
            //             {
            //                 writer.WriteLine("255 255 255");
            //             }
            //             k++;
            //         }
            //     writer.Close();
            //     Console.WriteLine(k);
            // }

        }
    }
}
