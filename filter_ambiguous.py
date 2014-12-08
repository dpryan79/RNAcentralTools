#!/usr/bin/env python
from Bio import SeqIO
import csv

of = open("no_ambiguous.fa", "w")
f = csv.reader(open("ambiguous.txt", "r"), dialect="excel-tab")
ambig = f.next()
for record in SeqIO.parse("mouse_RNAcentral.fa", "fasta") :
    record.seq = record.seq.back_transcribe()
    if(record.id == ambig[0]) :
        print("Skipping %s" % record.id)
        try :
            ambig = f.next()
        except :
            ambig = (None, None)
    else :
        SeqIO.write(record, of, "fasta")

of.close()
