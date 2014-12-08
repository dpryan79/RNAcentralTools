#!/usr/bin/env python
#~40 minutes versus ~4 for awk/sed
import glob
import csv
import gzip

#Sort a stack and run uniq() over it
def sortSquishStack(stack) :
    stack = sorted(stack, key=lambda foo: foo[1])#Sort by target
    ostack = []
    last = None
    for rec in stack :
        if rec[1] != last :
            last = rec[1]
            ostack.append(rec)
    return ostack

of = gzip.open("merged.gz", "wb")
total = 0

lrna = None
stack = []
for fname in sorted(glob.glob("output????.gz")) :
    print(fname)
    fgz = gzip.open(fname, "rb")
    f = csv.reader(fgz, dialect="excel-tab")
    for line in f :
        if(float(line[2]) >= 450) :
            #Trim off ">>"
            line[0] = line[0][2:]
            #Keep only the gene name
            idx = line[1].index("|")
            line[1] = line[1][:idx]
            if(line[0] == lrna) :
                stack.append([line[0], line[1]])
            else :
                if lrna == None :
                    lrna = line[0]
                if lrna != line[0] :
                    stack = sortSquishStack(stack)
                    for rec in stack :
                        of.write("%s\t%s\n" % (rec[0], rec[1]))
                    stack = []
                stack.append([line[0], line[1]])
    stack = sortSquishStack(stack)
    for rec in stack :
        of.write("%s\t%s\n" % (rec[0], rec[1]))
    fgz.close()
of.close()
