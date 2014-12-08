RNAcentralTools
===============

This repository contains a number of tools that I've found useful in using the [RNAcentral](http://rnacentral.org) in analysing small RNAs and piRNAs in particular. The main goals of these scripts is as follows:
 1. Filter for RNAs expressed in a given species.
 2. Remove low-quality RNAs
 3. Group near-identical species into clusters.
 4. Annotate the clusters with a likely species type.
 5. Provide a mechanism of streaming alignments in SAM/BAM form and:
    * Assigning groups of alignments to their most likely targets, given known read lengths
    * Counting the number of times alignments are to a single given cluster
