#!/bin/python3

import argparse
import array

parser = argparse.ArgumentParser()
parser.add_argument('-c', help="Command Processor's input file")
parser.add_argument('-r', help="RT Core's input file")
parser.add_argument('-co', help="output file for Command Processor")
parser.add_argument('-ro', help="output file for RT Core")
parser.add_argument('-p', help='print the output in binary', action='store_true')
args = parser.parse_args()
    
# TODO: add some debug info in output
# Parse the ISA structure
def parseISA(file):
    f = open(file)
    Dict = {}
    while True:
        ins = f.readline().split()
        line = f.readline()
        encoding = line.split()
        if not len(ins):
            break
        if encoding[0] == '#': # pseudo instruction
            Dict[ins[0]] = {'args': [ins[i] for i in range(1, len(ins))], 'pseudo': line[1:].strip().split(',')}
        else:
            Dict[ins[0]] = {'args': [(ins[i], int(encoding[i])) for i in range(1, len(ins))], 'opcode': encoding[0]}
            # for i in range(1, len(ins)):
            #     Dict[ins[0]]['args'].append((ins[i], int(encoding[i])))
    return Dict

def error(msg):
    print(msg)
    quit()

def binary(num, bits, unsigned=False):
    if unsigned:
        if num < 0:
            return ''
        if num >= (1 << bits):
            return ''
    else:
        if abs(num) >= (1 << (bits-1)):
            return ''
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

    def translate(self, tokens, entry, genLabeled):
        rets = []
        if not genLabeled and 'l' in entry['args']:
            rets.append((len(entry['pseudo']), self.lineCounter, tokens, tokens[0]))
            return rets
        line = 0
        for rule in entry['pseudo']:
            trans = rule.split()
            retTokens = []
            retIns = trans[0]
            r = []
            l = ''
            imm = ''
            args = entry['args']
            for i in range(len(args)):
                if args[i] == 'r':
                    r.append(tokens[i + 1])
                elif args[i] == 'l':
                    if tokens[i + 1] in self.labels:
                        target = self.labels[tokens[i + 1]]
                        offset = target - (self.PCCounter + line * 4) - 4
                        l = str(offset)
                    else:
                        self.err("No such label: " + tokens[i + 1])
                elif args[i] == 'i':
                    imm = tokens[i + 1]
                else:
                    self.err('syntax error')
            for i in trans:
                if i[0] == '$':
                    if i[1] == 'r':
                        retTokens.append(r[int(i[2:])])
                    elif i[1] == 'l':
                        retTokens.append(l)
                    elif i[1] == 'i':
                        retTokens.append(imm)
                    else:
                        self.err('syntax error')
                else:
                    retTokens.append(i)
            rets.append((retTokens, retIns))
            line += 1
        return rets

    def genCode(self, tokens, ins, genLabeled=False):
        entry = self.ISAdict[ins]
        if 'pseudo' in entry:
            trans = self.translate(tokens, entry, genLabeled)
            code = []
            for t in trans:
                if isinstance(t[0], int):
                    self.linesWaiting.append((self.PCCounter, t[1], t[2], t[3]))
                    code.extend([''] * t[0]) # placeholder
                else:
                    code.append(self.genCode(*t))
            return code
        else:
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
                            self.err('syntax error, expect register. Got: ' + t)
                        reg = int(t[1:])
                        reg = binary(reg, arg[1], True)
                        if not reg:
                            self.err('register out of range: ' + t)
                        code += reg
                    elif arg[0] == 'i':
                        imm = int(t)
                        imm = binary(imm, arg[1])
                        if not imm:
                            self.err('too large immediate: ' + t)
                        code += imm
                    elif arg[0] == 'ui':
                        imm = int(t)
                        imm = binary(imm, arg[1], True)
                        if not imm:
                            self.err('too large unsigned immediate: ' + t)
                        code += imm
                    elif arg[0] == 'l':
                        if genLabeled:
                            l = tokens[i - skip + 1] # case-sensitive
                            if l in self.labels:
                                target = self.labels[l]
                                offset = target - self.PCCounter - 4
                                offset = binary(offset, arg[1])
                                if not offset:
                                    self.err('cannot reach the label ' + l)
                                code += offset
                            else:
                                self.err("No such label: " + l)
                        else:
                            self.linesWaiting.append((self.PCCounter, self.lineCounter, tokens, ins))
                            # still return a string for placeholder
                    else:
                        self.err('syntax error')
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
                if tokens[0] == '@':
                    continue
                if line[0] == ' ' or line[0] == '\t':
                    ins = tokens[0].lower()
                    if ins in self.ISAdict:
                        if labelWait: # if previous line is a label
                            self.labels[labelWait] = self.PCCounter
                            labelWait = ''
                        gen = self.genCode(tokens, ins)
                        if isinstance(gen, list): # pseudo instruction may generate multiple ins
                            output.extend(gen)
                            self.PCCounter += 4 * len(gen)
                        else:
                            output.append(gen)
                            self.PCCounter += 4
                    elif ins in directives:
                        if labelWait:
                            directivesWaiting.append((tokens, ins, self.lineCounter, labelWait))
                            labelWait = ''
                        else:
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
                            gen = self.genCode(tokens, ins)
                            if isinstance(gen, list): # pseudo instruction may generate multiple ins
                                output.extend(gen)
                                self.PCCounter += 4 * len(gen)
                            else:
                                output.append(gen)
                                self.PCCounter += 4
                        elif ins in directives:
                            directivesWaiting.append((tokens, ins, self.lineCounter, tokens[0][:-1]))
                        else:
                            self.err('no such instruction')
                    else:
                        labelWait = tokens[0][:-1]

        for line in directivesWaiting:
            if line[3]:
                self.labels[line[3]] = self.PCCounter
            self.lineCounter = line[2]
            code = self.genDirective(line[0], line[1])
            if isinstance(code, list):
                output.extend(code)
                self.PCCounter += len(''.join(code)) // 8
            else:
                output.append(code)
                self.PCCounter += len(code) // 8

        for line in self.linesWaiting: # lines that contains label need second pass
            PC = line[0]
            self.lineCounter = line[1] # set lineCounter for error message
            self.PCCounter = PC
            code = self.genCode(line[2], line[3], True)
            if isinstance(code, list): # pseudo instruction may generate multiple ins
                # there will be placeholder for all waiting instruction
                for i in range(len(code)):
                    output[PC // 4 + i] = code[i]
            else:
                output[PC // 4] = code
        
        return output

if args.c:
    CPISA = parseISA('CP.isa')
    a = Assembler(CPISA)
    code = a.assemble(args.c)
    if args.p:
        print('Output for CP:')
        for i in code:
            print(i)
    if args.co:
        a.output(code, args.co)
    else:
        a.output(code, args.c + '.out')
if args.r:
    RTISA = parseISA('RT.isa')
    a = Assembler(RTISA)
    code = a.assemble(args.r)
    if args.p:
        print('Output for RT:')
        for i in code:
            print(i)
    if args.ro:
        a.output(code, args.ro)
    else:
        a.output(code, args.r + '.out')

if not args.r and not args.c:
    parser.print_help()