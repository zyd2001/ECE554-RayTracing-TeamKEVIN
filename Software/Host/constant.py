#!/bin/python
import sys, re, struct
lines = open(sys.argv[1]).readlines()

for i in range(len(lines)):
    lines[i] = re.sub("[^0-9\.#\-]", " ", lines[i])

c = bytearray()
ptr = bytearray()
light = bytearray()
material = bytearray()

barr = [c, light, material]
offset = 0x20000008

section = 0

for l in lines:
    values = l.split()
    if values:
        if values[0] == '#':
            offset += len(barr[section])
            ptr.extend(struct.pack('i', offset))
            section += 1
            continue
        for val in values:
            v = None
            try:
                v = int(val)
                barr[section].extend(struct.pack('i', v))
                # file.write(struct.pack('i', v))
            except ValueError:
                v = float(val)
                barr[section].extend(struct.pack('f', v))
                # file.write(struct.pack('f', v))
file = None
if len(sys.argv) != 2:
    file = open(sys.argv[1]+'.out', 'w')
    for i in range(len(c) // 4):
        for j in range(3, -1, -1):
            file.write('{:02x}'.format(c[i*4+j]))
        file.write('\n')
    for i in range(len(ptr) // 4):
        for j in range(3, -1, -1):
            file.write('{:02x}'.format(ptr[i*4+j]))
        file.write('\n')
    for i in range(len(light) // 4):
        for j in range(3, -1, -1):
            file.write('{:02x}'.format(light[i*4+j]))
        file.write('\n')
    for i in range(len(material) // 4):
        for j in range(3, -1, -1):
            file.write('{:02x}'.format(material[i*4+j]))
        file.write('\n')
    # file.write(c.hex())
    # file.write(ptr.hex())
    # file.write(light.hex())
    # file.write(material.hex())
else:
    file = open(sys.argv[1]+'.out', 'wb')
    file.write(c)
    file.write(ptr)
    file.write(light)
    file.write(material)
file.close()