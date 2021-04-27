using System;
using System.IO;
using System.Numerics;
using System.Threading;
using System.Threading.Tasks;
using SimulatorCore;

namespace SimulatorCLI
{
    class Simulator
    {
        Memory CPMem;
        Memory traingleMem;
        Memory RTMem = new Memory(0);
        CommandProcessor CP;
        RayTracing RT;
        bool disableTrace;
        TextWriter RTOutputFile;
        TextWriter CPOutputFile;
        internal Simulator(FileInfo CPFile, FileInfo RTFile, bool disableTrace,
            int CPMemorySize, int RTMemorySize, FileInfo triangleFile,
            FileInfo CPOutputFile, FileInfo RTOutputFile)
        {
            CPMem = new Memory(CPMemorySize);
            traingleMem = new Memory(triangleFile == null ? 0 : (int)triangleFile.Length);
            if (traingleMem != null)
                traingleMem.LoadToMemory(triangleFile.OpenRead());
            if (RTFile != null)
            {
                RTMem = new Memory((int)RTFile.Length);
                RTMem.LoadToMemory(RTFile.OpenRead());
            }
            if (CPFile != null)
                CPMem.LoadToMemory(CPFile.OpenRead());
            CP = new CommandProcessor(CPMem);
            RT = new RayTracing(RTMem, traingleMem, new Memory(RTMemorySize));
            this.disableTrace = disableTrace;
            this.RTOutputFile = RTOutputFile?.CreateText() ?? Console.Out;
            this.CPOutputFile = CPOutputFile?.CreateText() ?? Console.Out;

        }
        internal void Run()
        {
            int[] data = new int[64];
            EventWaitHandle canLaunch = new AutoResetEvent(true);
            bool isLaunch = false;
            Task lastRTTask = null;
            while (true)
            {
                CP.StartTrace();
                if (CP.Step(data, out isLaunch))
                    break;
                if (isLaunch)
                {
                    canLaunch.WaitOne();
                    int[] copyData = new int[64];
                    Array.Copy(data, copyData, 64);
                    lastRTTask = Task.Run(() =>
                    {
                        for (int i = 0; i < 64; i++)
                        {
                            int pixelID = copyData[i];
                            RT.ScalarRegisterFile[28] = 0 + RT.DataMemory.Mem.Length / 64 * i; // set Stack Pointer
                            RT.ScalarRegisterFile[29] = RT.ScalarRegisterFile[28].i;
                            RT.ScalarRegisterFile[31] = 0; // set PC
                            RT.ScalarRegisterFile[1] = pixelID;
                            RunRT(pixelID);
                        }
                        canLaunch.Set();
                    });
                }
                CP.EndTrace();
                if (!disableTrace)
                {
                    foreach (var trace in CP.RegisterFile.TraceLog)
                        CPOutputFile.Write("R{0} {1} => {2}; ", trace.id, trace.before, trace.after);
                    foreach (var trace in CP.Memory.TraceLog)
                        CPOutputFile.Write("{0} {1} => {2}; ", trace.address, trace.before, trace.after);
                    CPOutputFile.WriteLine();
                }
            }
            lastRTTask?.Wait(); // wait the last launch to complete
        }

        static string Hex(float f)
        {
            return Convert.ToHexString(BitConverter.GetBytes(f));
        }

        static string Hex(int i)
        {
            return Convert.ToHexString(BitConverter.GetBytes(i));
        }

        static string Hex(Vector4 v)
        {
            // return $"<{Hex(v.X)},{Hex(v.Y)},{Hex(v.Z)},{Hex(v.W)}>";
            return v.ToString();
        }

        internal void RunRT(int pixelID)
        {
            while (true)
            {
                RT.StartTrace();
                if (RT.Step())
                    break;
                RT.EndTrace();
                if (!disableTrace)
                {
                    RTOutputFile.WriteLine(RT.LastInstruction);
                    RTOutputFile.Write($"P{pixelID}: ");
                    foreach (var trace in RT.ScalarRegisterFile.TraceLog)
                        RTOutputFile.Write("S{0} {1} => {2}; ", trace.id, trace.before.Hex(), trace.after.Hex());
                    foreach (var trace in RT.VectorRegisterFile.TraceLog)
                        RTOutputFile.Write("V{0} {1} => {2}; ", trace.id, Hex(trace.before), Hex(trace.after));
                    foreach (var trace in RT.DataMemory.TraceLog)
                        RTOutputFile.Write("{0} {1} => {2}; ", trace.address, Hex(trace.before), Hex(trace.after));
                    RTOutputFile.WriteLine();
                }
            }
        }
    }
}