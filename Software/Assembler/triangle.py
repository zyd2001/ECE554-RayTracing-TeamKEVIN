#!/bin/python

import sys
import struct
file = open(sys.argv[1])

vertex = []
triangle = []

for line in file:
    line = line.split()
    if (len(line)):
        if (line[0] == "v"):
            vertex.append((float(line[1]), float(line[2]), float(line[3])))
        if (line[0] == "f"):
            t = [0,0,0]
            for i in range(1, 4):
                p = line[i].split('/')
                t[i-1] = int(p[0])
            triangle.append(t)
f = 1
if (len(sys.argv) == 2):
    f = open(sys.argv[1] + '.out', "wb")
else:
    f = open(sys.argv[1] + '.out', "w")
if (len(sys.argv) == 2):
    for ind, t in enumerate(triangle):
        # b = bytearray()
        # b.extend(struct.pack("i", ind + 1))
        for i in range(3):
        # for i in range(2,-1, -1):
            # b.extend(struct.pack("i", t[i]-1))
            f.write(struct.pack("i", t[i]-1))
        f.write(struct.pack("i", ind + 1))
        # b.reverse()
        # f.write(b)
    for i in range(4):
        f.write(struct.pack("i", 0))
    for v in vertex:
        # b = bytearray()
        # b.extend(struct.pack("i", 123))
        for i in range(3):
        # for i in range(2,-1, -1):
            # b.extend(struct.pack("f", v[i]))
            f.write(struct.pack("f", v[i]))
        f.write(struct.pack("i", 123))
        # f.write(b)
    for i in range(4):
        f.write(struct.pack("i", 0))
else:
    for t in triangle:
        for i in range(3):
            v = vertex[t[i]-1]
            for j in range(3):
                f.write(str(v[j]) + ' ')
            f.write('\n')