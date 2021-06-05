#!/bin/python

import sys
import struct

name = sys.argv[1].split('.')[0]

objfile = open(sys.argv[1])
mtlfile = open(name + ".mtl")

material_list = {}

current_mtl = None
counter = 2 # for convinence, vector minus 1
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
        
        if (line[0] == "v"):
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
            triangle.append(t)


f = 1
if (len(sys.argv) == 2):
    f = open(name + '.out', "wb")
else:
    f = open(name + '.out', "w")


if (len(sys.argv) == 2):
    for ind, t in enumerate(triangle):
        for i in range(4):
            f.write(struct.pack("i", t[i]-1))
    for i in range(4):
        f.write(struct.pack("i", 0))
    for v in vertex:
        for i in range(3):
            f.write(struct.pack("f", v[i]))
        f.write(struct.pack("i", 123))
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

file = open(name + '.material', 'w')

for index in material_list:
    m = material_list[index]
    file.write('Material ' + index + '\n')
    file.write(', '.join([str(num) for num in m['color']]))
    file.write(', 1.0\n')
    if 'roughness' in m:
        file.write(m['roughness'])
    else:
        file.write('1.0')
    file.write(', ')
    if 'metal' in m:
        file.write(m['metal'])
    else:
        file.write('0.0')
    file.write(', 0, 0\n')

f.close()