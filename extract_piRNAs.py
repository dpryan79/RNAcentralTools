#!/usr/bin/env python
import csv
from Bio import SeqIO

clusters = []
annos = csv.reader(open("RNAcentral_clusters_annotations.txt", "r"), dialect="excel-tab")
for anno in annos :
    if(anno[2] == "piRNA") :
        clusters.append(int(anno[0]))

annos = csv.reader(open("RNAcentral_clusters.txt", "r"), dialect="excel-tab")
ofile = open("piRNAs.fa", "w")
idx = 0
for rec in SeqIO.parse("no_ambiguous.fa", "fasta") :
    anno = annos.next()
    if(int(anno[1]) in clusters) :
        if(len(rec.seq) < 35) :
            SeqIO.write(rec, ofile, "fasta")

ofile.close()
