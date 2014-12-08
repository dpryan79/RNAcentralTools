#!/usr/bin/env python
import re
import csv

f = csv.reader(open("clustered.clstr.I.annotated", "r"), dialect="excel-tab")
of = open("cluster_to_id.txt", "w")
count = 0
cluster = 0
for line in f:
    if(len(line) == 1) :
        if(count != 0) :
            cluster += 1
    else :
        matches = re.search("([0-9]+)nt, >(URS[0-9A-F]+)\.", line[1])
        if(matches == None) :
            print(line)
            continue
        of.write("%s\t%i\t%s\t%s\n" % (matches.group(2), cluster, line[2], matches.group(1)))
        count += 1
of.close()
