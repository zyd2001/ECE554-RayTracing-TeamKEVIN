using Microsoft.VisualStudio.TestTools.UnitTesting;
using SimulatorCore;
using System.IO;
using System;

namespace SimulatorTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(16);
            Console.WriteLine(sRF[0].f); // use R0 as float
        }
    }
}
