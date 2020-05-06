#!/usr/bin/env python3

# call like this:
# ./remove-redden.py $(ag -l redden src/)

# TODO: fail on nested REMOVE
# TODO: explicitly ignore escaped delimiters

import sys

REMOVE = '\\redden'
DELIMITERS = ['{', '}']

def mark_removals(text):
    removals = []
    for i in range(0, len(text)):
        if text[i:i+len(REMOVE)+1] == REMOVE + DELIMITERS[0]:
            removals.append([i, i+len(REMOVE)+1])
            depth = 1
            pos = i + len(REMOVE)+1
            while depth > 0:
                pos = pos + 1
                if text[pos] == DELIMITERS[0]:
                    depth = depth + 1
                elif text[pos] == DELIMITERS[1]:
                    depth = depth - 1
            removals.append([pos, pos+1])
    return removals

def remove(text, removals):
    for i in reversed(removals):
        text = text[:i[0]] + text[i[1]:]
    return text

for i in range(1, len(sys.argv)):
    with open(sys.argv[i], 'r') as infile:
        instring = infile.read()

    removals = mark_removals(instring)
    outstring = remove(instring, removals)

    with open(sys.argv[i], 'w') as outfile:
        outfile.write(outstring)
