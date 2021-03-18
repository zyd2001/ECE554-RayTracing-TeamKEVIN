#!/bin/python3

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-c', help="Command Processor's input file")
parser.add_argument('-r', help="RT Core's input file")
parser.add_argument('output', help="output file")
args = parser.parse_args()
    
# Parse the ISA structure
def parseISA(file):
    f = open(file)
    Dict = {}
    while True:
        ins = f.readline().split()
        encoding = f.readline().split()
        if not len(ins):
            break
        Dict[ins[0]] = {'args': [], 'opcode': encoding[0]}
        for i in range(1, len(ins)):
            Dict[ins[0]]['args'].append((ins[i], int(encoding[i])))
            if ins[i] == 'x':
                pass
    return Dict

def error(msg):
    print(msg)
    quit()

def binary(num, bits):
    if num >= 0:
        s = bin(num)[2:]
        if len(s) < bits:
            return (bits - len(s)) * '0' + s
        else:
            return s
    else:
        return bin((1 << bits) + num)[2:]

def genCode(ISAdict, tokens, ins, lineCounter):
    entry = ISAdict[ins]
    code = entry['opcode']
    skip = 0
    for i in range(len(entry['args'])):
        arg = entry['args'][i]
        if arg[0] == 'x':
            code += 'x' * arg[1]
            skip += 1
        else: 
            t = tokens[i - skip + 1].strip().lower()
            if arg[0] == 'r':
                if t[0] != 'r':
                    error(str(lineCounter) +  ': syntax error')
                reg = int(t[1:])
                if reg >= 2**arg[1]:
                    error(str(lineCounter) +  ': syntax error')
                code += binary(reg, arg[1])
            elif arg[0] == 'i':
                imm = int(t)
                if imm >= 2**arg[1]:
                    error(str(lineCounter) +  ': too large immediate')
                code += binary(imm, arg[1])
            elif arg[0] == 'l':
                pass
    return code

def assemble(ISAdict, inFile, outFile):
    labels = {}
    inFile = open(inFile)
    # outFile = open()
    directives = set(('.asciiz', '.space', '.word', '.byte'))
    lineCounter = 0
    codeCounter = 0
    for line in inFile: # first pass
        lineCounter += 1
        tokens = line.split()
        if tokens:
            if line[0] == ' ' or line[0] == '\t':
                pass
            else: # label
                if tokens[0][-1] != ':':
                    error(str(lineCounter) +  ': expect :')
                if len(tokens) > 1:
                    labels[tokens[0][:-1]] = lineCounter
                else:
                    labels[tokens[0][:-1]] = lineCounter + 1

    lineCounter = 0
    codeCounter = 0
    inFile.seek(0, 0)
    for line in inFile:
        lineCounter += 1
        tokens = line.split()
        if tokens:
            if line[0] != ' ' and line[0] != '\t':
                if len(tokens) > 1:
                    tokens = tokens[1:]
            ins = tokens[0].lower()
            if ins in ISAdict:
                code = genCode(ISAdict, tokens, ins, lineCounter)
                print(code)
            elif ins in directives:
                pass
            else:
                error(str(lineCounter) +  ': no such instruction')

ISA = parseISA('RT.isa')
assemble(ISA, args.c, args.output)