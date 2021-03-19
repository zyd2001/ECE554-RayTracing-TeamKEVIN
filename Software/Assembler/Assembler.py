#!/bin/python3

import argparse
import array

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

    def __init__(self, isa):
        self.ISAdict = isa

    def err(self, msg):
        error(str(self.lineCounter) + ': ' + msg)

    def output(self, code, outFile):
        outFile = open(outFile, 'wb')
        for line in code:
            arr = array.array('B') 
            for i in range(0, len(line), 8):
                arr.append(int(line[i:i+8], base=2))
            arr.reverse()
            outFile.write(arr.tobytes())

    def genCode(self, tokens, ins, genLabeled=False):
        entry = self.ISAdict[ins]
        code = entry['opcode']
        skip = 0
        for i in range(len(entry['args'])):
            arg = entry['args'][i]
            if arg[0] == 'x':
                code += '0' * arg[1]
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

    def genDirective(self, tokens, ins):
        code = ''
        if ins == '.string':
            code = []
            for i in bytes(tokens[1].strip('"'), "utf-8").decode("unicode_escape"): # handle escape character
                code.append(binary(ord(i), 8))
            code.append('0' * 8)
        elif ins == '.space':
            code = '0' * 8 * int(tokens[1])
        elif ins == '.word':
            num = int(tokens[1])
            if num >= 2**32:
                self.err('word too large')
            code = binary(int(num), 32)
        else:
            code = []
            for i in tokens[1:]:
                i = int(i)
                if (i >= 256):
                    self.err('byte too large')
                code.append(binary(i, 8))
        return code

    def assemble(self, inFile):
        output = []
        self.linesWaiting = []
        self.labels = {}
        self.lineCounter = 0
        self.PCCounter = 0
        inFile = open(inFile)
        directives = set(('.string', '.space', '.word', '.byte'))
        labelWait = ''
        directivesWaiting = []
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
                        if labelWait:
                            directivesWaiting.append((tokens, ins, self.lineCounter, labelWait))
                            labelWait = ''
                        else:
                            # print(str(self.lineCounter) + ": warning, constant without label")
                            directivesWaiting.append((tokens, ins, self.lineCounter, labelWait))
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
                            directivesWaiting.append((tokens, ins, self.lineCounter, tokens[0][:-1]))
                        else:
                            self.err('no such instruction')
                    else:
                        labelWait = tokens[0][:-1]

        for line in directivesWaiting:
            if line[3]:
                self.labels[line[3]] = self.PCCounter
            self.PCCounter += 1
            self.lineCounter = line[2]
            code = self.genDirective(line[0], line[1])
            if isinstance(code, list):
                output.extend(code)
            else:
                output.append(code)

        for line in self.linesWaiting:
            PC = line[0]
            self.lineCounter = line[1]
            self.PCCounter = PC
            code = self.genCode(line[2], line[3], True)
            output[PC] = code
        
        return output

ISA = parseISA('RT.isa')
a = Assembler(ISA)
code = a.assemble(args.c)
print(code)
# a.output(code, 'o')

out_test_2 = a.assemble('test/2.asm')
answers = ['0010000100110100', '11110000011110011', '010000010100001001000011', '00000000000000000000']
# for i in range(0,4):
#     if out_test_2[i] != answers[i]:
#         print("Error on line ", i, "! Output should be ", answers[i], " but the returned value is ", out_test_2[i])
print(out_test_2)
a.output(out_test_2, 'o')
