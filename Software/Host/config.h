// Greg Stitt
// University of Florida

#ifndef __CONFIG_H__
#define __CONFIG_H__

//=============================================================
// Configuration settings

// Change "volatile int" to any data type you want to be stored in the input
// and output arrays. Note that removal of the volatile qualifier requires
// modification of main.cpp to use AFU::mallocNonvolatile(), which isn't
// guaranteed to work.
typedef volatile char dma_data_t;

// Other examples:
//typedef volatile double dma_data_t;
//typedef volatile unsigned char dma_data_t;
// typedef int dma_data_t; // Must use AFU::mallocNonvolatile()
// You can also use struct and class types, but will have to change the
// initialization and verification code in main.cpp.

// When simulating, there is a loop that does nothing but wait for the DMA
// to finish. This constant "polling" is very inefficient and can slow down
// the CPU. Defining this flag causes the processor to periodically sleep
// during this polling.
// NOTE: For execution on the FPGA, comment this out.
#define SLEEP_WHILE_WAITING

// The number of milliseconds to sleep when SLEEP_WHILE_WAITING is defined.
const unsigned SLEEP_MS = 10;

const int OUTPUT_SIZE = 32 * 4;

const int VECTOR_SIZE = 0x10;

enum ConstantAddr
{
    CAMERA_LOC = 0x10,
    CAMERA_LOOK = 0x20,
    SKY_HORIZON = 0x40,
    SKY_TOP = 0x50,
    AMBIENT = 0x60,
    
    LIGHT = 0x78
};

//=============================================================
// AFU MMIO Addresses

enum MmioAddr
{
    CP_ADDR = 0x50,
    CP_SIZE = 0x52,
    CP_LOAD = 0x54,
    RT_ADDR = 0x56,
    RT_SIZE = 0x58,
    RT_LOAD = 0x5a,
    CON_ADDR = 0x5c,
    CON_SIZE = 0x5e,
    CON_LOAD = 0x60,
    TRI_ADDR = 0x62,
    TRI_SIZE = 0x64,
    TRI_LOAD = 0x66,
    OUT_ADDR = 0x68,
    CONDITION = 0x6a,
};

#endif
