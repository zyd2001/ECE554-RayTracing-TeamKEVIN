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

            Assert.AreEqual<int>(-1429471232, sRF[0].i);

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

            Assert.AreEqual<int>(43724, sRF[0].i);

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
            s_get_from_v g = new s_get_from_v(0, 0, 1);

            g.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(6, sRF[0].i);

        }

        [TestMethod]
        public void TestMethod6()
        {
            // testing v_load_16byte and v_store_16byte

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);


            vRF[2] = new Vector4(5, 6, 7, 8);
            v_store_16byte vs = new v_store_16byte(2, 1, 15);

            v_load_16byte vl = new v_load_16byte(0, 1, 15);

            vs.process(vRF, sRF, m, ic);
            vl.process(vRF, sRF, m, ic);
            //Console.Write(MemoryMarshal.Read<int>(m.read(1)));
            //Console.Write(MemoryMarshal.Read<float>(BitConverter.GetBytes((float)5)));
            Console.Write(vRF[0]);

            Assert.AreEqual<float>(7, vRF[0].Z);

        }

        [TestMethod]
        public void TestMethod7()
        {
            // testing vv_add

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            vRF[2] = new Vector4(5, 6, 7, 8);
            vRF[1] = new Vector4(1, 2, 3, 4);
            vv_add va = new vv_add(0, 1, 2);

            Vector4 ans = new Vector4(6, 8, 10, 12);

            va.process(vRF, sRF, m, ic);

            Assert.AreEqual<float>(ans.X, vRF[0].X);
            Assert.AreEqual<float>(ans.Y, vRF[0].Y);
            Assert.AreEqual<float>(ans.Z, vRF[0].Z);
            Assert.AreEqual<float>(ans.W, vRF[0].W);


        }

        [TestMethod]
        public void TestMethod8()
        {
            // testing vv_sub

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            vRF[2] = new Vector4(5, 6, 7, 8);
            vRF[1] = new Vector4(1, 2, 3, 4);
            vv_sub vs = new vv_sub(0, 1, 2);

            Vector4 ans = new Vector4(-4, -4, -4, -4);

            vs.process(vRF, sRF, m, ic);

            Assert.AreEqual<float>(ans.X, vRF[0].X);
            Assert.AreEqual<float>(ans.Y, vRF[0].Y);
            Assert.AreEqual<float>(ans.Z, vRF[0].Z);
            Assert.AreEqual<float>(ans.W, vRF[0].W);


        }

        [TestMethod]
        public void TestMethod9()
        {
            // testing vv_mul_ele

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            vRF[2] = new Vector4(5, 6, 7, 8);
            vRF[1] = new Vector4(1, 2, 3, 4);
            vv_mul_ele vs = new vv_mul_ele(0, 1, 2);

            Vector4 ans = new Vector4(5, 12, 21, 32);

            vs.process(vRF, sRF, m, ic);

            Assert.AreEqual<float>(ans.X, vRF[0].X);
            Assert.AreEqual<float>(ans.Y, vRF[0].Y);
            Assert.AreEqual<float>(ans.Z, vRF[0].Z);
            Assert.AreEqual<float>(ans.W, vRF[0].W);


        }

        [TestMethod]
        public void TestMethod10()
        {
            // testing vv_div

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            vRF[2] = new Vector4(5, 6, 7, 8);
            vRF[1] = new Vector4(1, 2, 3, 4);
            vv_div vd = new vv_div(0, 1, 2);

            Vector4 ans = new Vector4((float)1 / 5, (float)1 / 3, (float)3 / 7, (float)4 / 8);

            vd.process(vRF, sRF, m, ic);

            Assert.AreEqual<float>(ans.X, vRF[0].X);
            Assert.AreEqual<float>(ans.Y, vRF[0].Y);
            Assert.AreEqual<float>(ans.Z, vRF[0].Z);
            Assert.AreEqual<float>(ans.W, vRF[0].W);


        }

        [TestMethod]
        public void TestMethod11()
        {
            // testing vv_mul_dot

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            vRF[2] = new Vector4(5, 6, 7, 8);
            vRF[1] = new Vector4(1, 2, 3, 4);
            vv_mul_dot dot = new vv_mul_dot(0, 1, 2);



            dot.process(vRF, sRF, m, ic);

            Assert.AreEqual<float>(70, sRF[0].f);


        }

        [TestMethod]
        public void TestMethod12()
        {
            // testing vv_magn

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);


            vRF[1] = new Vector4(1, 2, 3, 4);
            v_magn mn = new v_magn(0, 1);



            mn.process(vRF, sRF, m, ic);

            Assert.AreEqual<float>((float)Math.Sqrt(Math.Pow(1, 2) + Math.Pow(2, 2) + Math.Pow(3, 2)), sRF[0].f);


        }

        [TestMethod]
        public void TestMethod13()
        {
            // testing v_get_from_s

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);


            vRF[0] = new Vector4(1, 2, 3, 4);
            sRF[1] = (float)5;
            v_get_from_s vs = new v_get_from_s(1, 0, 2);



            vs.process(vRF, sRF, m, ic);

            Assert.AreEqual<float>((float)5, vRF[0].Z);



        }

        [TestMethod]
        public void TestMethod14()
        {
            // testing not

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);



            sRF[1] = 10;
            not n = new not(0, 1);



            n.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(-11, sRF[0].i);



        }

        [TestMethod]
        public void TestMethod15()
        {
            // testing and

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);



            sRF[1] = 10;
            sRF[2] = 9;
            and a = new and(0, 1, 2);



            a.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(8, sRF[0].i);



        }

        [TestMethod]
        public void TestMethod16()
        {
            // testing or

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);



            sRF[1] = 10;
            sRF[2] = 9;
            or o = new or(0, 1, 2);



            o.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(11, sRF[0].i);



        }

        [TestMethod]
        public void TestMethod17()
        {
            // testing xor

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);



            sRF[1] = 10;
            sRF[2] = 9;
            xor x = new xor(0, 1, 2);



            x.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(3, sRF[0].i);



        }

        [TestMethod]
        public void TestMethod18()
        {
            // testing itof

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);



            sRF[1] = 10;

            itof it = new itof(0, 1);



            it.process(vRF, sRF, m, ic);

            Assert.AreEqual<float>((float)10, sRF[0].f);



        }

        [TestMethod]
        public void TestMethod19()
        {
            // testing ftoi

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);



            sRF[1] = (float)10.6;

            ftoi ft = new ftoi(0, 1);



            ft.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>((int)10, sRF[0].i);



        }

        [TestMethod]
        public void TestMethod20()
        {
            // testing cmp_v

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);



            vRF[1] = new Vector4(1, 2, 3, 4);
            vRF[2] = new Vector4(1, 2, 3, 5);

            cmp_v c = new cmp_v(1, 2);

            c.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(3, sRF[32].i);

            vRF[2] = new Vector4(1, 2, 3, 4);
            c.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[32].i);
        }

        [TestMethod]
        public void TestMethod21()
        {
            // testing cmp_i

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            cmp_i c = new cmp_i(1, 2);

            sRF[1] = 1;
            sRF[2] = 1;
            c.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[32].i);

            sRF[1] = 1;
            sRF[2] = 2;
            c.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(1, sRF[32].i);


            sRF[1] = 2;
            sRF[2] = 1;
            c.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(2, sRF[32].i);


        }

        [TestMethod]
        public void TestMethod22()
        {
            // testing cmp_f

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            cmp_f c = new cmp_f(1, 2);

            sRF[1] = (float)1.5;
            sRF[2] = (float)1.5;
            c.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[32].i);

            sRF[1] = (float)1.5;
            sRF[2] = (float)2;
            c.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(1, sRF[32].i);


            sRF[1] = (float)2.5;
            sRF[2] = (float)1;
            c.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(2, sRF[32].i);


        }

        [TestMethod]
        public void TestMethod23()
        {
            // testing bne

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            cmp_f c = new cmp_f(1, 2);
            bne b = new bne(5);

            sRF[1] = (float)1.5;
            sRF[2] = (float)1.5;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[31].i);

            sRF[1] = (float)1.5;
            sRF[2] = (float)2;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(5, sRF[31].i);




        }

        [TestMethod]
        public void TestMethod24()
        {
            // testing bg

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            cmp_f c = new cmp_f(1, 2);
            bg b = new bg(5);

            sRF[1] = (float)1.5;
            sRF[2] = (float)1.5;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[31].i);

            sRF[1] = (float)2;
            sRF[2] = (float)1;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(5, sRF[31].i);




        }

        [TestMethod]
        public void TestMethod25()
        {
            // testing bl

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            cmp_f c = new cmp_f(1, 2);
            bl b = new bl(5);

            sRF[1] = (float)1.5;
            sRF[2] = (float)1.5;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[31].i);

            sRF[1] = (float)1;
            sRF[2] = (float)2;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(5, sRF[31].i);




        }

        [TestMethod]
        public void TestMethod26()
        {
            // testing bge_rt

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            cmp_f c = new cmp_f(1, 2);
            bge_rt b = new bge_rt(5);

            sRF[1] = (float)1.5;
            sRF[2] = (float)1.5;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(5, sRF[31].i);

            sRF[1] = (float)2;
            sRF[2] = (float)1;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(10, sRF[31].i);




        }

        [TestMethod]
        public void TestMethod27()
        {
            // testing ble_rt

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            cmp_f c = new cmp_f(1, 2);
            ble_rt b = new ble_rt(5);

            sRF[1] = (float)1.5;
            sRF[2] = (float)1.5;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(5, sRF[31].i);

            sRF[1] = (float)1;
            sRF[2] = (float)2;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(10, sRF[31].i);




        }

        [TestMethod]
        public void TestMethod28()
        {
            // testing bge_rt

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            cmp_f c = new cmp_f(1, 2);
            bge_rt b = new bge_rt(5);

            sRF[1] = (float)1.5;
            sRF[2] = (float)1.5;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(5, sRF[31].i);

            sRF[1] = (float)2;
            sRF[2] = (float)1;
            c.process(vRF, sRF, m, ic);

            b.process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(10, sRF[31].i);




        }

        [TestMethod]
        public void TestMethod29()
        {
            // testing jmp

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            jmp j = new jmp(10);


            j.process(vRF, sRF, m, ic);
            Assert.AreEqual<int>(10, sRF[31].i);



        }

        [TestMethod]
        public void TestMethod30()
        {
            // testing jmp_link and ret

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);





            jmp_link j = new jmp_link(10);

            sRF[31] = 1;

            j.process(vRF, sRF, m, ic);
            Assert.AreEqual<int>(1, sRF[30].i);
            Assert.AreEqual<int>(11, sRF[31].i);

            ret r = new ret();
            r.process(vRF, sRF, m, ic);
            Assert.AreEqual<int>(1, sRF[31]);

        }

        [TestMethod]
        public void TestMethod31()
        {
            // testing s_push and s_pop

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(33);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);




            sRF[0] = 15;
            s_push pu = new s_push(0);
            s_pop po = new s_pop(0);

            pu.process(vRF, sRF, m, ic);
            po.process(vRF, sRF, m, ic);
            Assert.AreEqual<int>(15, sRF[0].i);


        }

        [TestMethod]
        public void TestMethod32()
        {
            // testing v_push and v_pop

            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);


            vRF[2] = new Vector4(5, 6, 7, 8);
            v_push vs = new v_push(2);

            v_pop vl = new v_pop(0);

            vs.process(vRF, sRF, m, ic);
            vl.process(vRF, sRF, m, ic);
            //Console.Write(MemoryMarshal.Read<int>(m.read(1)));
            //Console.Write(MemoryMarshal.Read<float>(BitConverter.GetBytes((float)5)));
            Console.Write(vRF[0]);

            Assert.AreEqual<float>(7, vRF[0].Z);
        }
    }
}