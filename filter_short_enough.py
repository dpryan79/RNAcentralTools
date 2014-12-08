#!/usr/bin/env python
from Bio import SeqIO
import re

of = open("to_map.fa", "w")
for record in SeqIO.parse("no_ambiguous.fa", "fasta") :
    record.seq = record.seq.back_transcribe()
    if(len(record.seq) >= 50000) :
        record.seq = record.seq[:49999]
    SeqIO.write(record, of, "fasta")
    #else :
    #    print("skipping %s" % record.description)

of.close()
