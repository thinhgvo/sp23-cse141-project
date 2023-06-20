registers = {'R0' : '0000', 'R1' : '0001','R2' : '0010','R3' : '0011','R4' : '0100','R5' : '0101','R6' : '0110','R7' : '0111','R8' : '1000',
    'R9' : '1001','R10' : '1010','R11' : '1011','R12' : '1100','R13' : '1101','R14' : '1110','R15' : '1111'}

def ReadingAndWriting(assembly_code, machine_code):
    with(open(assembly_code, 'r') as input, open(machine_code, 'w') as out):
        line = input.readline()
        while(line):
            res = ''
            instr = line.split()
            # R-type instructions
            if(instr[0] == 'AND'):
                res += '00000'
            elif(instr[0] == 'OR'):
                res += '00001'
            elif(instr[0] == 'NOT'):
                res += '00010'
            elif(instr[0] == 'ADD'):
                res += '00011'
            elif(instr[0] == 'SUB'):
                res += '00100'
            elif(instr[0] == 'LOAD'):
                res += '00101'
            elif(instr[0] == 'STR'):
                res += '00110'
            elif(instr[0] == 'SLT'):
                res += '00111'
            elif(instr[0] == 'SEQ'):
                res += '01000'
            elif(instr[0] == 'BEQONE'):
                res += '01001'
            elif(instr[0] == 'MVT'):
                res += '01010'
            elif(instr[0] == 'MVF'):
                res += '01011'
            elif(instr[0] == 'X0R'):
                res += '01100'
            elif(instr[0] == 'XORR'):
                res += '01101'
            # I-type instructions
            elif(instr[0] == 'ADDI'):
                res += '1000'
            elif(instr[0] == 'SUBI'):
                res += '1001'
            elif(instr[0] == 'BR'):
                res += '1010'
            elif(instr[0] == 'LSRI'):
                res += '1011'
            elif(instr[0] == 'LSLI'):
                res += '1100'
            elif(instr[0] == 'LUT'):
                res += '1101'
            elif(instr[0] == 'HALT'):
                res += '111111111'

            if(instr[0] != 'BEQONE' and instr[0] != 'BR'):
                if(len(instr) >= 2 and '#' in instr[1]):
                    num = bin(int(instr[1][1:]))[2:]
                    res += num.zfill(5)
                else:
                    if(instr[0] != 'HALT'):
                        res += registers[instr[1]]
                    else:
                        pass
            else:
                if(instr[0] == 'BR'):
                    res += '00000'
                else:
                    res += '0000'
            res += '\n'
            out.write(res)
            line = input.readline()

ReadingAndWriting('assembly_code.txt', 'machine_code.txt')
