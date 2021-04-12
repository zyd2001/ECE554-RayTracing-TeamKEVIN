
import os.path
import random

def gen_rand_from_bits(bit_count):
    return str(random.randint(0, 2**bit_count - 1))

def generate_cp(num_instrs):

    # list of possible instructions generated
    instr_list = []
    bits_list = []
    f = open(os.path.join( os.getcwd(), '..', 'CP.isa' ))
    out_file = open('rand_assembly.txt', 'w')
    lines = f.readlines()
    lindex = len(lines)
    for line in lines:
        if lindex % 2 == 0:
            instr_list.append(line.split())
        else:
            bits_list.append(line.split())
        lindex = lindex + 1

    # generating the randomized instructions
    
    instrs = []
    for i in range(0, num_instrs):
        instr = ""
        instr_index = random.randint(0, len(instr_list) - 6) # for now does not support pseudo instruction

        instr += instr_list[instr_index][0]
        for j in range(1, len(instr_list[instr_index])):
            if instr_list[instr_index][j] == 'r':
                instr += ' r' + gen_rand_from_bits(int(bits_list[instr_index][j]))
            elif instr_list[instr_index][j] == 'i' or instr_list[instr_index][j] == 'l':
                instr += ' ' + gen_rand_from_bits(int(bits_list[instr_index][j]))
            
        
        instr += "\n"
        instrs.append(instr)

    out_file.writelines(instrs)
    return

def generate_rt(num_instrs):
    # list of possible instructions generated
    instr_list = []
    bits_list = []
    f = open(os.path.join( os.getcwd(), '..', 'RT.isa' ))
    out_file = open('rand_assembly.txt', 'w')
    lines = f.readlines()
    lindex = len(lines)
    for line in lines:
        if lindex % 2 == 0:
            instr_list.append(line.split())
        else:
            bits_list.append(line.split())
        lindex = lindex + 1

    # generating the randomized instructions
    
    instrs = []
    for i in range(0, num_instrs):
        instr = ""
        instr_index = random.randint(0, len(instr_list) - 8) # for now does not support pseudo instruction

        instr += instr_list[instr_index][0]
        for j in range(1, len(instr_list[instr_index])):
            if instr_list[instr_index][j] == 'r':
                instr += ' r' + gen_rand_from_bits(int(bits_list[instr_index][j]))
            elif instr_list[instr_index][j] == 'i' or instr_list[instr_index][j] == 'l':
                instr += ' ' + gen_rand_from_bits(int(bits_list[instr_index][j]))
            
        
        instr += "\n"
        instrs.append(instr)

    out_file.writelines(instrs)
    return

generate_rt(5)
#print(gen_rand_from_bits(2))