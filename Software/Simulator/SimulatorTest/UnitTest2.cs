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

            m.Write(15, BitConverter.GetBytes(2500));
            s_load_4byte ld = new s_load_4byte(0, 1, 15);
            ld.Process(vRF, sRF, m, ic);
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
            st.Process(vRF, sRF, m, ic);
            ld.Process(vRF, sRF, m, ic);
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



            s_write_high swh = new s_write_high(0, 43724);
            swh.Process(vRF, sRF, m, ic);

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



            s_write_low swl = new s_write_low(0, 43724);
            swl.Process(vRF, sRF, m, ic);

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

            g.Process(vRF, sRF, m, ic);

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

            vs.Process(vRF, sRF, m, ic);
            vl.Process(vRF, sRF, m, ic);
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

            va.Process(vRF, sRF, m, ic);

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

            vs.Process(vRF, sRF, m, ic);

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

            vs.Process(vRF, sRF, m, ic);

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

            vd.Process(vRF, sRF, m, ic);

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



            dot.Process(vRF, sRF, m, ic);

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



            mn.Process(vRF, sRF, m, ic);

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



            vs.Process(vRF, sRF, m, ic);

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



            n.Process(vRF, sRF, m, ic);

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



            a.Process(vRF, sRF, m, ic);

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



            o.Process(vRF, sRF, m, ic);

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



            x.Process(vRF, sRF, m, ic);

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



            it.Process(vRF, sRF, m, ic);

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



            ft.Process(vRF, sRF, m, ic);

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

            c.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(3, sRF[32].i);

            vRF[2] = new Vector4(1, 2, 3, 4);
            c.Process(vRF, sRF, m, ic);

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
            c.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[32].i);

            sRF[1] = 1;
            sRF[2] = 2;
            c.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(1, sRF[32].i);


            sRF[1] = 2;
            sRF[2] = 1;
            c.Process(vRF, sRF, m, ic);

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
            c.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[32].i);

            sRF[1] = (float)1.5;
            sRF[2] = (float)2;
            c.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(1, sRF[32].i);


            sRF[1] = (float)2.5;
            sRF[2] = (float)1;
            c.Process(vRF, sRF, m, ic);

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
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[31].i);

            sRF[1] = (float)1.5;
            sRF[2] = (float)2;
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

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
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[31].i);

            sRF[1] = (float)2;
            sRF[2] = (float)1;
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

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
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(0, sRF[31].i);

            sRF[1] = (float)1;
            sRF[2] = (float)2;
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

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
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(5, sRF[31].i);

            sRF[1] = (float)2;
            sRF[2] = (float)1;
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

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
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(5, sRF[31].i);

            sRF[1] = (float)1;
            sRF[2] = (float)2;
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

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
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

            Assert.AreEqual<int>(5, sRF[31].i);

            sRF[1] = (float)2;
            sRF[2] = (float)1;
            c.Process(vRF, sRF, m, ic);

            b.Process(vRF, sRF, m, ic);

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


            j.Process(vRF, sRF, m, ic);
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

            j.Process(vRF, sRF, m, ic);
            Assert.AreEqual<int>(1, sRF[30].i);
            Assert.AreEqual<int>(11, sRF[31].i);

            ret r = new ret();
            r.Process(vRF, sRF, m, ic);
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

            pu.Process(vRF, sRF, m, ic);
            po.Process(vRF, sRF, m, ic);
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

            vs.Process(vRF, sRF, m, ic);
            vl.Process(vRF, sRF, m, ic);
            //Console.Write(MemoryMarshal.Read<int>(m.read(1)));
            //Console.Write(MemoryMarshal.Read<float>(BitConverter.GetBytes((float)5)));
            Console.Write(vRF[0]);

            Assert.AreEqual<float>(7, vRF[0].Z);
        }

        [TestMethod]
        public void TestMethod33()
        {
            // ToString test
            and and = new and(1, 2, 3);
            Assert.AreEqual("and r1 r2 r3", and.ToString());
            bne bne = new bne(1);
            Assert.AreEqual("bne 1", bne.ToString());
            bg bg = new bg(1);
            Assert.AreEqual("bg 1", bg.ToString());
            bl bl = new bl(1);
            Assert.AreEqual("bl 1", bl.ToString());
            bge_rt bge_rt = new bge_rt(1);
            Assert.AreEqual("bge_rt 1", bge_rt.ToString());
            ble_rt ble_rt = new ble_rt(1);
            Assert.AreEqual("ble_rt 1", ble_rt.ToString());
            cmp_i cmpi = new cmp_i(1, 2);
            Assert.AreEqual("cmp_i r1 r2", cmpi.ToString());
            cmp_f cmpf = new cmp_f(1, 2);
            Assert.AreEqual("cmp_f r1 r2", cmpf.ToString());
            cmp_v cmpv = new cmp_v(1, 2);
            Assert.AreEqual("cmp_v r1 r2", cmpv.ToString());
            ff_add ff_add = new ff_add(1, 2, 3);
            Assert.AreEqual("ff_add r1 r2 r3", ff_add.ToString());
            ff_sub ff_sub = new ff_sub(1, 2, 3);
            Assert.AreEqual("ff_sub r1 r2 r3", ff_sub.ToString());
            ff_mul ff_mul = new ff_mul(1, 2, 3);
            Assert.AreEqual("ff_mul r1 r2 r3", ff_mul.ToString());
            ff_div ff_div = new ff_div(1, 2, 3);
            Assert.AreEqual("ff_div r1 r2 r3", ff_div.ToString());
            fin fin = new fin();
            Assert.AreEqual("fin", fin.ToString());
            ftoi ftoi = new ftoi(1, 2);
            Assert.AreEqual("ftoi r1 r2", ftoi.ToString());
            ii_add ii_add = new ii_add(1, 2, 3);
            Assert.AreEqual("ii_add r1 r2 r3", ii_add.ToString());
            ii_addi ii_addi = new ii_addi(1, 2, 3);
            Assert.AreEqual("ii_addi r1 r2 3", ii_addi.ToString());
            ii_sub ii_sub = new ii_sub(1, 2, 3);
            Assert.AreEqual("ii_sub r1 r2 r3", ii_sub.ToString());
            ii_subi ii_subi = new ii_subi(1, 2, 3);
            Assert.AreEqual("ii_subi r1 r2 3", ii_subi.ToString());
            ii_mul ii_mul = new ii_mul(1, 2, 3);
            Assert.AreEqual("ii_mul r1 r2 r3", ii_mul.ToString());
            ii_muli ii_muli = new ii_muli(1, 2, 3);
            Assert.AreEqual("ii_muli r1 r2 3", ii_muli.ToString());
            ii_div ii_div = new ii_div(1, 2, 3);
            Assert.AreEqual("ii_div r1 r2 r3", ii_div.ToString());
            ii_divi ii_divi = new ii_divi(1, 2, 3);
            Assert.AreEqual("ii_divi r1 r2 3", ii_divi.ToString());
            itof itof = new itof(1, 2);
            Assert.AreEqual("itof r1 r2", itof.ToString());
            jmp jmp = new jmp(1);
            Assert.AreEqual("jmp 1", jmp.ToString());
            jmp_link jmp_link = new jmp_link(1);
            Assert.AreEqual("jmp_link 1", jmp_link.ToString());
            not not = new not(1, 2);
            Assert.AreEqual("not r1 r2", not.ToString());
            or or = new or(1, 2, 3);
            Assert.AreEqual("or r1 r2 r3", or.ToString());
            ret ret = new ret();
            Assert.AreEqual("ret", ret.ToString());
            s_get_from_v sgfv = new s_get_from_v(1, 2, 3);
            Assert.AreEqual("s_get_from_v r1 r2 3", sgfv.ToString());
            s_load_4byte sl4b = new s_load_4byte(1, 2, 3);
            Assert.AreEqual("s_load_4byte r1 r2 3", sl4b.ToString());
            s_store_4byte ss4b = new s_store_4byte(1, 2, 3);
            Assert.AreEqual("s_store_4byte r1 r2 3", ss4b.ToString());
            s_write_high swh = new s_write_high(1, 5);
            Assert.AreEqual("s_write_high r1 5", swh.ToString());
            s_write_low swl = new s_write_low(1, 5);
            Assert.AreEqual("s_write_low r1 5", swl.ToString());
            s_push s_push = new s_push(1);
            Assert.AreEqual("s_push r1", s_push.ToString());
            s_pop s_pop = new s_pop(1);
            Assert.AreEqual("s_pop r1", s_pop.ToString());
            v_push v_push = new v_push(1);
            Assert.AreEqual("v_push r1", v_push.ToString());
            v_pop v_pop = new v_pop(1);
            Assert.AreEqual("v_pop r1", v_pop.ToString());
            v_get_from_s vgfs = new v_get_from_s(1, 2, 3);
            Assert.AreEqual("v_get_from_s r1 r2 3", vgfs.ToString());
            v_load_16byte vl16 = new v_load_16byte(1, 2, 3);
            Assert.AreEqual("v_load_16byte r1 r2 3", vl16.ToString());
            v_magn v_magn = new v_magn(1, 2);
            Assert.AreEqual("v_magn r1 r2", v_magn.ToString());
            v_store_16byte vs16 = new v_store_16byte(1, 2, 3);
            Assert.AreEqual("v_store_16byte r1 r2 3", vs16.ToString());
            vf_add vf_add = new vf_add(1, 2, 3);
            Assert.AreEqual("vf_add r1 r2 r3", vf_add.ToString());
            vf_sub vf_sub = new vf_sub(1, 2, 3);
            Assert.AreEqual("vf_sub r1 r2 r3", vf_sub.ToString());
            vf_mul vf_mul = new vf_mul(1, 2, 3);
            Assert.AreEqual("vf_mul r1 r2 r3", vf_mul.ToString());
            vf_div vf_div = new vf_div(1, 2, 3);
            Assert.AreEqual("vf_div r1 r2 r3", vf_div.ToString());
            vi_add vi_add = new vi_add(1, 2, 3);
            Assert.AreEqual("vi_add r1 r2 r3", vi_add.ToString());
            vi_sub vi_sub = new vi_sub(1, 2, 3);
            Assert.AreEqual("vi_sub r1 r2 r3", vi_sub.ToString());
            vi_mul vi_mul = new vi_mul(1, 2, 3);
            Assert.AreEqual("vi_mul r1 r2 r3", vi_mul.ToString());
            vi_div vi_div = new vi_div(1, 2, 3);
            Assert.AreEqual("vi_div r1 r2 r3", vi_div.ToString());
            vv_add vv_add = new vv_add(1, 2, 3);
            Assert.AreEqual("vv_add r1 r2 r3", vv_add.ToString());
            vv_sub vv_sub = new vv_sub(1, 2, 3);
            Assert.AreEqual("vv_sub r1 r2 r3", vv_sub.ToString());
            vv_mul_ele vv_mul_ele = new vv_mul_ele(1, 2, 3);
            Assert.AreEqual("vv_mul_ele r1 r2 r3", vv_mul_ele.ToString());
            vv_mul_dot vv_mul_dot = new vv_mul_dot(1, 2, 3);
            Assert.AreEqual("vv_mul_dot r1 r2 r3", vv_mul_dot.ToString());
            vv_div vv_div = new vv_div(1, 2, 3);
            Assert.AreEqual("vv_div r1 r2 r3", vv_div.ToString());
            xor xor = new xor(1, 2, 3);
            Assert.AreEqual("xor r1 r2 r3", xor.ToString());
        }

        [TestMethod]
        public void TestMethod34()
        {
            // Test s_sqrt
            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            sRF[1] = (float)16.0;
            s_sqrt sq = new s_sqrt(0, 1);
            sq.Process(vRF, sRF, m, ic);

            Assert.AreEqual(4.0, sRF[0].f);

        }

        [TestMethod]
        public void TestMethod35()
        {
            // Test v_reduce
            RegisterFile<Vector4> vRF = new RegisterFile<Vector4>(32);
            RegisterFile<Scalar> sRF = new RegisterFile<Scalar>(32);
            Memory m = new Memory(5000);
            Memory m_ic = new Memory(5000);
            IntersectionCore ic = new IntersectionCore(m_ic);

            vRF[0] = new Vector4(1, 2, 3, 4);
            v_reduce vr = new v_reduce(0, 0);
            vr.Process(vRF, sRF, m, ic);

            Assert.AreEqual(10, sRF[0].f);

        }
    }
}