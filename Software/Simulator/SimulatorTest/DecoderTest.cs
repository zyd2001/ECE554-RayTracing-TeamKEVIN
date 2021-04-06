using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SimulatorCore;
using System.IO;

namespace SimulatorTest
{
    [TestClass]
    public class DecoderTest
    {
        [TestMethod]
        public void TestMethod1()
        {
            Decoder decoder = new Decoder(File.OpenText("/home/zyd/Code/ECE554-RayTracing-TeamKEVIN/Software/Simulator/SimulatorCore/CPInstruction/CP.isa"), 4);
            FileStream fileStream = File.OpenRead("/home/zyd/Code/ECE554-RayTracing-TeamKEVIN/Software/Simulator/SimulatorCore/CPInstruction/test.asm.out");
            byte[] buffer = new byte[1024];
            fileStream.Read(buffer, 0, 1024);
            decoder.Decode(buffer[4..8]);
            // decoder.Decode(buffer[8..12]);
            decoder.Decode(buffer[16..20]);
            int a = 1;
            a = (a << 23) >> (234);
        }
    }
}
