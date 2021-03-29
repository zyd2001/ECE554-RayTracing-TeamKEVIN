using Microsoft.VisualStudio.TestTools.UnitTesting;
using SimulatorCore;
using System.IO;
using System;
using System.Numerics;
using System.Runtime.InteropServices;

namespace SimulatorTest
{
    [TestClass]
    public class UnitTest2
    {
        [TestMethod]
        public void TestMethod1()
        {
            // testing s_load_4byte
            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);
            
            m.write(15, BitConverter.GetBytes(2500));
            s_load_4byte ld = new s_load_4byte(0, 1, 15);
            ld.process(vRF, sRF, m, ic);
            Assert.AreEqual<int>(2500, sRF[0].i);
        }

        [TestMethod]
        public void TestMethod2()
        {
            // testing s_store_4byte
            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);
            
            sRF[0] = 51;
            s_store_4byte st = new s_store_4byte(0, 1, 15);
            
            s_load_4byte ld = new s_load_4byte(1, 5, 15);
            st.process(vRF, sRF, m, ic);
            ld.process(vRF, sRF, m, ic);
            Assert.AreEqual<int>(51, sRF[1].i);
        }

        [TestMethod]
        public void TestMethod3()
        {
            // testing s_write_high
            
            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            

            s_write_high swh = new s_write_high(0, "1010101011001100");
            swh.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(52224, sRF[0].i);

        }

        [TestMethod]
        public void TestMethod4()
        {
            // testing s_write_low
            
            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            

            s_write_low swl = new s_write_low(0, "1010101011001100");
            swl.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(204, sRF[0].i);

        }

        [TestMethod]
        public void TestMethod5()
        {
            // testing s_get_from_v
            
            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            vRF[0] = new Vector4(5, 6, 7, 8);
            s_get_from_v g = new s_get_from_v(0,0,1);
            
            g.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(6, sRF[0].i);

        }

        [TestMethod]
        public void TestMethod6()
        {
            // testing v_load_16byte
            
            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            
            vRF[2] = new Vector4(5,6,7,8); 
            v_store_16byte vs = new v_store_16byte(2, 1, 15);
            
            v_load_16byte vl = new v_load_16byte(0, 1, 15);
            
            vs.process(vRF, sRF, m, ic);
            vl.process(vRF, sRF, m, ic);
            //Console.Write(MemoryMarshal.Read<int>(m.read(1)));
            //Console.Write(MemoryMarshal.Read<float>(BitConverter.GetBytes((float)5)));
            Console.Write(vRF[0]);

            Assert.AreEqual<float>(7, vRF[0].Z);

        }
        
        
    }
}