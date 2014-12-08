#!/usr/bin/env python
from Bio import SeqIO
import re

of = open("rRNAtRNA.fa", "w")
pattern_U = re.compile("U")
for record in SeqIO.parse("mouse_RNAcentral.fa", "fasta") :
    record.seq = record.seq.back_transcribe()
    if(re.search("rRNA", record.description) != None) :
        SeqIO.write(record, of, "fasta")
    elif(re.search("tRNA", record.description) != None) :
        SeqIO.write(record, of, "fasta")
    elif(re.search("ibosomal", record.description) != None) :
        SeqIO.write(record, of, "fasta")
of.close()
