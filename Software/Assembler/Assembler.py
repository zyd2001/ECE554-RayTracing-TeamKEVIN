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

class Assembler:
    ISAdict = {}
    labels = {}
    linesWaiting = []
    lineCounter = 0
    PCCounter = 0

    def err(self, msg):
        error(str(self.lineCounter) + ': ' + msg)

    def genCode(self, tokens, ins, genLabeled=False):
        entry = self.ISAdict[ins]
        code = entry['opcode']
        skip = 0
        for i in range(len(entry['args'])):
            arg = entry['args'][i]
            if arg[0] == 'x':
                code += 'x' * arg[1]
                skip += 1
            else: 
                t = tokens[i - skip + 1].lower()
                if arg[0] == 'r':
                    if t[0] != 'r':
                        self.err('syntax error')
                    reg = int(t[1:])
                    if reg >= 2**arg[1]:
                        self.err('syntax error')
                    code += binary(reg, arg[1])
                elif arg[0] == 'i':
                    imm = int(t)
                    if imm >= 2**arg[1]:
                        self.err('too large immediate')
                    code += binary(imm, arg[1])
                elif arg[0] == 'l':
                    if genLabeled:
                        l = tokens[i - skip + 1]
                        if l in self.labels:
                            target = self.labels[l]
                            offset = target - self.PCCounter - 1
                            if offset >= 2**arg[1]:
                                self.err('cannot reach the label')
                            code += binary(offset, arg[1])
                    else:
                        self.linesWaiting.append((self.PCCounter, self.lineCounter, tokens, ins))
        return code

    def assemble(self, ISA, inFile, outFile):
        output = []
        self.labels = {}
        self.ISAdict = ISA
        inFile = open(inFile)
        # outFile = open()
        directives = set(('.asciiz', '.space', '.word', '.byte'))
        self.lineCounter = 0
        self.PCCounter = 0
        labelWait = ''
        for line in inFile: # first pass
            self.lineCounter += 1
            tokens = line.split()
            if tokens:
                if line[0] == ' ' or line[0] == '\t':
                    ins = tokens[0].lower()
                    if ins in self.ISAdict:
                        if labelWait:
                            self.labels[labelWait] = self.PCCounter
                            labelWait = ''
                        output.append(self.genCode(tokens, ins))
                        self.PCCounter += 1
                    elif ins in directives:
                        pass
                    else:
                        self.err('no such instruction')
                else: # label
                    if tokens[0][-1] != ':':
                        self.err('expect :')
                    if len(tokens) > 1:
                        self.labels[tokens[0][:-1]] = self.PCCounter
                        tokens = tokens[1:]
                        ins = tokens[0].lower()
                        if ins in self.ISAdict:
                            output.append(self.genCode(tokens, ins))
                            self.PCCounter += 1
                        elif ins in directives:
                            pass
                        else:
                            self.err('no such instruction')
                    else:
                        labelWait = tokens[0][:-1]

        for line in self.linesWaiting:
            PC = line[0]
            self.lineCounter = line[1]
            self.PCCounter = PC
            code = self.genCode(line[2], line[3], True)
            output[PC] = code
        
        return output

ISA = parseISA('RT.isa')
a = Assembler()
print(a.assemble(ISA, args.c, args.output))