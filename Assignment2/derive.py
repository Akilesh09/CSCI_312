from sys import *
import string

length = 3 #Sets default length to 3

#Stores filename and length(optional) from the invocation
for arg in argv:
    if arg != "derive.py" and arg[0] == "-":
        length = int(arg[2:])
    elif arg != "derive.py":
        file_name = arg

#Creates a dictionary called d
d = {}

#Process the grammar file and stores it into the dictionary
first_time = True
for line in open(file_name, "r"):
    symbols = line.split()
    if first_time == True:
        start_symbol = symbols[0]
        meta_symbol = symbols[1]
    first_time = False
    terminal = symbols[0]
    non_terminals = " ".join(symbols[2:])
    if terminal in d.keys():
        d[terminal].append(non_terminals)
    else:
        d[terminal] = [non_terminals]

#Implenting the alogrith provided in the Project description
w = [start_symbol]
str_set = set()

while w:
    current_string =  w.pop(0)
    l = current_string.split()
    if len(l) > length:
        continue
    if not any(item in d.keys() for item in l) and len(l) == length:
        str_set.add(current_string)
    else:
        i = 0
        while i < len(l):
            if l[i] in d:
                for production in d[l[i]]:
                    new_string = " ".join(l[:i] + production.split() + l[i+1:])
                    w.append(new_string)
            i += 1

strings = sorted(str_set)

#Printing the results
for line in strings:
    print(line)

print("\n# of strings generated:", len(strings))
        



