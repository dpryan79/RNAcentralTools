#!/usr/bin/env python
import re
import sys
import argparse

parser = argparse.ArgumentParser(description="Annotate the output from cd-hit-est with gene names from no_ambiguous.fa")
parser.add_argument("ifile", help="Input file name")
parser.add_argument("ofile", help="Output file name")
args = parser.parse_args()

if(args.ifile == None or args.ofile == None) :
    print("You must specify both an input and output file.")
    sys.exit()

#load the IDs
f = open("no_ambiguous.fa", "r")
h = dict()
for line in f :
    if(line[0] == ">") :
        matches = re.search(">(URS[0-9A-F]+) (.*)", line)
        if(matches == None) :
            continue
        id = matches.group(1)
        name = matches.group(2)
        h[id] = name

f.close()

#Annotate the file
ifile = open(args.ifile, "r")
ofile = open(args.ofile, "w")
unmatched = 0
for line in ifile :
    line = line.rstrip()
    if(line[0] != ">") :
        matches = re.search(">(URS[0-9A-F]+)\.", line)
        if(matches == None) :
            ofile.write("%s\n" % line)
            unmatched += 1
        else :
            if((matches.group(1) in h) == False) :
                print(matches.group(1))
            ofile.write("%s\t%s\n" % (line, h.get(matches.group(1))))
    else :
        ofile.write("%s\n" % line)
ifile.close()
ofile.close()
print("there were %i unmatched entries" % unmatched)
