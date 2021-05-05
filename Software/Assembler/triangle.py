#!/bin/python

import sys
import struct
objfile = open(sys.argv[1])
mtlfile = open(sys.argv[1]+".mtl")

material_list = {}

material = {}

current_mtl = None
counter = 2
for line in mtlfile:
    line = line.split()
    if line:
        if line[0] == "newmtl":
            current_mtl = {"id": counter}
            material_list[line[1]] = current_mtl
            counter += 1
        if current_mtl:
            if line[0] == "Kd":
                current_mtl["color"] = [float(line[1]), float(line[2]), float(line[3])]
            if line[0] == "Pr":
                current_mtl["roughness"] = float(line[1])
            if line[0] == "Pm":
                current_mtl["metal"] = float(line[1])

triangle = []
vertex = []
cmtl = 0

for line in objfile:
    line = line.split()
    if line:
        # if line[0] == "o":
        #     current_object = {"vertex": [], "triangle": []}
        #     object_list.append(current_object)
        # if current_object:
        if (line[0] == "v"):
            # current_object["vertex"].append((float(line[1]), float(line[2]), float(line[3])))
            vertex.append((float(line[1]), float(line[2]), float(line[3])))
        if (line[0] == "usemtl"):
            cmtl = material_list[line[1]]["id"]
        if (line[0] == "f"):
            t = [0,0,0]
            for i in range(1, 4):
                p = line[i].split('/')
                t[i-1] = int(p[0])
            if cmtl == 0:
                raise Exception('fv<k')
            t.append(cmtl)
            # current_object["triangle"].append(t)
            triangle.append(t)

# vertex = []
# triangle = []

# for line in objfile:
#     line = line.split()
#     if (len(line)):
#         if (line[0] == "v"):
#             vertex.append((float(line[1]), float(line[2]), float(line[3])))
#         if (line[0] == "f"):
#             t = [0,0,0]
#             for i in range(1, 4):
#                 p = line[i].split('/')
#                 t[i-1] = int(p[0])
#             triangle.append(t)
f = 1
if (len(sys.argv) == 2):
    f = open(sys.argv[1] + '.out', "wb")
else:
    f = open(sys.argv[1] + '.out', "w")


if (len(sys.argv) == 2):
    for ind, t in enumerate(triangle):
        # b = bytearray()
        # b.extend(struct.pack("i", ind + 1))
        for i in range(4):
        # for i in range(2,-1, -1):
            # b.extend(struct.pack("i", t[i]-1))
            f.write(struct.pack("i", t[i]-1))
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
        f.write(str(t[3] - 1) + '\n')

f.close()