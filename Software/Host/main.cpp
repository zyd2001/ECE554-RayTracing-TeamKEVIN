// Copyright (c) 2020 University of Florida
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Greg Stitt
// University of Florida
//
// Description: This application demonstrates a DMA AFU where the FPGA transfers
// data from an input array into an output array.
//
// The example demonstrates an extension of the AFU wrapper class that uses
// AFU::malloc() to dynamically allocate virtually contiguous memory that can
// be accessed by both software and the AFU.

// INSTRUCTIONS: Change the configuration settings in config.h to test
// different types of data.

#include <cstdlib>
#include <iostream>
#include <cmath>
#include <fstream>
#include <stdio.h>

#include <opae/utils.h>

#include "AFU.h"
// Contains application-specific information
#include "config.h"
// Auto-generated by OPAE's afu_json_mgr script
#include "afu_json_info.h"
#include <string>

using namespace std;

void clearMem(dma_data_t *mem, int size)
{
    for (int i = 0; i < size; i++)
        mem[i] = 0;
}

void readFile(dma_data_t *data, ifstream &f)
{
    char ch;
    while (true)
    {
        f.read(&ch, 1);
        if (f.eof())
            break;
        *data = ch;
        data++;
    }
}

ifstream::pos_type filesize(ifstream &f)
{
    f.seekg(0, f.end);
    auto size = f.tellg();
    f.seekg(0, f.beg);
    return size;
}

void getOutput(dma_data_t *data, ofstream &out)
{
    volatile float *ptr = (volatile float *)data;
    for (int i = 0; i < OUTPUT_SIZE / 4; i++)
    {
        for (int j = 0; j < 3; j++)
        {
            out << *ptr * 255;
            out << " ";
            ptr++;
        }
        ptr++;
        out << "\n";
        // for (int j = 0; j < 4; j++, ptr++)
        // {
        //     out << *ptr;
        //     out << " ";
        // }
        // out << "\n";
    }
}

int main(int argc, char *argv[])
{

    // unsigned long size, num_tests;
    // if (!checkUsage(argc, argv, size, num_tests))
    // {
    //     printUsage(argv[0]);
    //     return EXIT_FAILURE;
    // }

    try
    {
        // Create an AFU object to provide basic services for the FPGA. The
        // constructor searchers available FPGAs for one with an AFU with the
        // the specified ID
        AFU afu(AFU_ACCEL_UUID);
        bool failed = false;

        // for (unsigned test = 0; test < num_tests; test++)
        // {

        ifstream cp("CP.out1", ios::binary), rt("finalmain.asm.out", ios::binary),
            con("constant.dat.out1", ios::binary), tri("box.obj.out", ios::binary);

        ofstream out("output.pfm");
        string str = "P3\n16 12\n255\n";
        out << str;

        cout << "Starting...\n";

        unsigned int CPInsSize, RTInsSize, constantSize, triangleSize;
        unsigned int CPInsFileSize, RTInsFileSize, constantFileSize, triangleFileSize;
        CPInsFileSize, RTInsFileSize, constantFileSize, triangleFileSize;
        CPInsSize = filesize(cp);
        CPInsFileSize = CPInsSize;
        RTInsSize = filesize(rt);
        RTInsFileSize = RTInsSize;
        constantSize = filesize(con);
        constantFileSize = constantSize;
        triangleSize = filesize(tri);
        triangleFileSize = triangleSize;
        CPInsSize = CPInsSize - CPInsSize % 64 + 64;
        RTInsSize = RTInsSize - RTInsSize % 64 + 64;
        constantSize = constantSize - constantSize % 64 + 64;
        triangleSize = triangleSize - triangleSize % 64 + 64;

        auto CPIns = afu.malloc<dma_data_t>(CPInsSize);
        auto RTIns = afu.malloc<dma_data_t>(RTInsSize);
        auto constant = afu.malloc<dma_data_t>(constantSize);
        auto triangle = afu.malloc<dma_data_t>(triangleSize);
        auto output = afu.malloc<dma_data_t>(OUTPUT_SIZE * 4);

        printf("CP: %d\n RT: %d\n Con: %d\n Tri: %d\n", CPInsSize, RTInsSize, constantSize, triangleSize);
        printf("CP: %p\n RT: %p\n Con: %p\n Tri: %p\n Out: %p\n", CPIns, RTIns, constant, triangle, output);

        int CPindex = 0;

        clearMem(CPIns, CPInsSize);
        clearMem(RTIns, RTInsSize);
        clearMem(constant, constantSize);
        clearMem(triangle, triangleSize);
        clearMem(output, OUTPUT_SIZE * 4);

        // cp.read(CPIns, CPInsFileSize);
        // rt.read(RTIns, RTInsFileSize);
        // con.read(constant, constantFileSize);
        // triangle.read(triangle, triangleFileSize);
        readFile(CPIns, cp);
        readFile(RTIns, rt);
        readFile(constant, con);
        readFile(triangle, tri);

        // Inform the FPGA of the starting read and write address of the arrays.
        afu.write(LOAD, (uint64_t)CPIns);
        afu.write(LOAD | ((RTInsSize / AFU::CL_BYTES) << 2), (uint64_t)RTIns);
        afu.write(LOAD | ((constantSize / AFU::CL_BYTES) << 2), (uint64_t)constant);
        afu.write(LOAD | ((triangleSize / AFU::CL_BYTES) << 2), (uint64_t)triangle);
        afu.write(80, (uint64_t)output);
        // The FPGA DMA only handles cache-line transfers, so we need to convert
        // the array size to cache lines.

        // Wait until the FPGA is done.
        while (true)
        {
            while (true)
            {
                auto ret = afu.read(80);
                // printf("%d\n", ret);
                if (ret == 0)
                {
#ifdef SLEEP_WHILE_WAITING
                    this_thread::sleep_for(chrono::milliseconds(SLEEP_MS));
#endif
                    continue;
                }
                else if (ret == 1)
                {
                    fprintf(stderr, "get\n");
                    getOutput(output, out);
                    afu.write(2, 0);
                    printf("haha\n");
                    // break;
                }
                else
                {
                    fprintf(stderr, "break\n");
                    getOutput(output, out);
                    break;
                }
            }
            break;
        }

        out.close();
        printf("stop\n");
        // Free the allocated memory.
        afu.free(CPIns);
        afu.free(RTIns);
        afu.free(constant);
        afu.free(triangle);
        afu.free(output);
        // }
        return EXIT_SUCCESS;
    }
    // Exception handling for all the runtime errors that can occur within
    // the AFU wrapper class.
    catch (const fpga_result &e)
    {

        // Provide more meaningful error messages for each exception.
        if (e == FPGA_BUSY)
        {
            cerr << "ERROR: All FPGAs busy." << endl;
        }
        else if (e == FPGA_NOT_FOUND)
        {
            cerr << "ERROR: FPGA with accelerator " << AFU_ACCEL_UUID
                 << " not found." << endl;
        }
        else
        {
            // Print the default error string for the remaining fpga_result types.
            cerr << "ERROR: " << fpgaErrStr(e) << endl;
        }
    }
    catch (const runtime_error &e)
    {
        cerr << e.what() << endl;
    }
    catch (const opae::fpga::types::no_driver &e)
    {
        cerr << "ERROR: No FPGA driver found." << endl;
    }

    return EXIT_FAILURE;
}