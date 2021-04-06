using System;
using System.Numerics;
using System.Runtime.InteropServices;


namespace SimulatorCore
{
    class s_push : RTInstruction
    {
        int r0;

        internal s_push(int r0)
        {
            this.r0 = r0;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[29] = sRF[29] + 4;
            var bytes = BitConverter.GetBytes(sRF[r0]);
            mem.Write(sRF[29] + sRF[28], bytes);


        }
    }

    class s_pop : RTInstruction
    {
        int r0;


        internal s_pop(int r0)
        {
            this.r0 = r0;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            if (sRF[29] == 0)
            {
                Console.Write("Tried to pop from empty stack!!!");
                return;
            }

            sRF[r0] = MemoryMarshal.Read<int>(mem.Read(sRF[29] + sRF[28]));
            sRF[29] = sRF[29] - 4;


        }
    }

    class v_push : RTInstruction
    {
        int r0;

        internal v_push(int r0)
        {
            this.r0 = r0;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            sRF[29] = sRF[29] + 4;
            mem.Write(sRF[29] + sRF[28], BitConverter.GetBytes(vRF[r0].X));
            sRF[29] = sRF[29] + 4;
            mem.Write(sRF[29] + sRF[28], BitConverter.GetBytes(vRF[r0].Y));
            sRF[29] = sRF[29] + 4;
            mem.Write(sRF[29] + sRF[28], BitConverter.GetBytes(vRF[r0].Z));
            sRF[29] = sRF[29] + 4;
            mem.Write(sRF[29] + sRF[28], BitConverter.GetBytes(vRF[r0].W));


        }
    }

    class v_pop : RTInstruction
    {
        int r0;


        internal v_pop(int r0)
        {
            this.r0 = r0;
        }

        internal override void process(RegisterFile<Vector4> vRF, RegisterFile<Scalar> sRF, Memory mem, IntersectionCore ic)
        {
            if (sRF[29] == 0)
            {
                Console.Write("Tried to pop from empty stack!!!");
                return;
            }

            Vector4 vec = new Vector4(MemoryMarshal.Read<float>(mem.Read(sRF[29] + sRF[28] - 12)),
            MemoryMarshal.Read<float>(mem.Read(sRF[29] + sRF[28] - 8)),
            MemoryMarshal.Read<float>(mem.Read(sRF[29] + sRF[28] - 4)),
            MemoryMarshal.Read<float>(mem.Read(sRF[29] + sRF[28])));
            sRF[29] = sRF[29] - 16;
            vRF[r0] = vec;


        }
    }


}