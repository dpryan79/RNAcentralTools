#!/usr/bin/env python
from Bio import SeqIO
import re

of = open("mouse_RNAcentral.filtered.fa", "w")
for record in SeqIO.parse("mouse_RNAcentral.fa", "fasta") :
    record.seq = record.seq.back_transcribe()
    #if(re.search("null", record.description) != None) :
    #    continue
    #if(re.search("(house mouse)", record.description) != None) :
    if(re.search("eastern", record.description) == None) :
        SeqIO.write(record, of, "fasta")
of.close()
