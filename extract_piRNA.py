#!/usr/bin/env python
from Bio import SeqIO
import re

of = open("piRNA.fa", "w")
for record in SeqIO.parse("mouse_RNAcentral.fa", "fasta") :
    record.seq = record.seq.back_transcribe()
    if(re.search("piRNA", record.description) != None) :
        SeqIO.write(record, of, "fasta")
of.close()
