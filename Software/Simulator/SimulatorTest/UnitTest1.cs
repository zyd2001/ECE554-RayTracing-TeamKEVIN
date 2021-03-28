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
        [TestMethod]
        public void TestMethod2()
        {
            // test add
            RegisterFile<int> iRF = new RegisterFile<int>(16);
            Memory m = new Memory(5000);
            addi a = new addi(0, 1, 15);
            a.process(iRF, m);
            Assert.AreEqual<int>(15, iRF[0]); 
        }

        [TestMethod]
        public void TestMethod3()
        {

            // test sub
            RegisterFile<int> iRF = new RegisterFile<int>(16);
            Memory m = new Memory(5000);
            subi a = new subi(0, 1, 15);
            a.process(iRF, m);
            Assert.AreEqual<int>(-15, iRF[0]);
            
        }

        [TestMethod]
        public void TestMethod4()
        {
            // test mul
            RegisterFile<int> iRF = new RegisterFile<int>(16);
            Memory m = new Memory(5000);
            addi a = new addi(0, 1, 2);
            muli mu = new muli(0, 0, 2);
            a.process(iRF, m);
            mu.process(iRF, m);
            Assert.AreEqual<int>(4, iRF[0]);
        }

        [TestMethod]
        public void TestMethod5()
        {
            // test bz (take branch)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            bz b = new bz(2, 10);
            
            b.process(iRF, m);
            Assert.AreEqual<int>(10, iRF[16]);
        }

        [TestMethod]
        public void TestMethod6()
        {
            // test bz (don't take branch)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            addi a = new addi(2, 0, 1);
            bz b = new bz(2, 10);
            a.process(iRF, m);
            b.process(iRF, m);
            Assert.AreEqual<int>(0, iRF[16]);
        }
        

        [TestMethod]
        public void TestMethod7()
        {
            // test bnz (take branch)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            addi a = new addi(2, 0, 1);
            bnz b = new bnz(2, 10);
            a.process(iRF, m);
            b.process(iRF, m);
            Assert.AreEqual<int>(10, iRF[16]);
        }

        [TestMethod]
        public void TestMethod8()
        {
            // test bnz (don't take branch)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            bnz b = new bnz(2, 10);
            
            b.process(iRF, m);
            Assert.AreEqual<int>(0, iRF[16]);
        }

        [TestMethod]
        public void TestMethod9()
        {
            // test bge (take branch with rd = 0)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            bge b = new bge(2, 10);
            
            b.process(iRF, m);
            Assert.AreEqual<int>(10, iRF[16]);
        }

        [TestMethod]
        public void TestMethod10()
        {
            // test bge (take branch with rd > 0)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            addi a = new addi(2, 0, 1);
            bge b = new bge(2, 10);
            a.process(iRF, m);
            b.process(iRF, m);
            Assert.AreEqual<int>(10, iRF[16]);
        }

        [TestMethod]
        public void TestMethod11()
        {
            // test bge (don't take branch with rd < 0)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            subi a = new subi(2, 0, 1);
            bge b = new bge(2, 10);
            a.process(iRF, m);
            b.process(iRF, m);
            Assert.AreEqual<int>(0, iRF[16]);
        }

        [TestMethod]
        public void TestMethod12()
        {
            // test ble (take branch with rd = 0)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            ble b = new ble(2, 10);
            
            b.process(iRF, m);
            Assert.AreEqual<int>(10, iRF[16]);
        }

        [TestMethod]
        public void TestMethod13()
        {
            // test ble (don't take branch with rd > 0)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            addi a = new addi(2, 0, 1);
            ble b = new ble(2, 10);
            a.process(iRF, m);
            b.process(iRF, m);
            Assert.AreEqual<int>(0, iRF[16]);
        }

        [TestMethod]
        public void TestMethod14()
        {
            // test ble (take branch with rd < 0)
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            subi a = new subi(2, 0, 1);
            ble b = new ble(2, 10);
            a.process(iRF, m);
            b.process(iRF, m);
            Assert.AreEqual<int>(10, iRF[16]);
        }

        [TestMethod]
        public void TestMethod15()
        {
            // test ld 
            RegisterFile<int> iRF = new RegisterFile<int>(17);
            Memory m = new Memory(5000);
            byte[] val = {5, 1, 5, 1};
            m.write(15, val);
            ld l = new ld(0, 1, 15);
            
            l.process(iRF, m);
            
            Assert.AreEqual()
        }
    }
}
