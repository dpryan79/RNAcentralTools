#!/bin/bash
#Should take input/output name
zcat output????.gz | awk 'BEGIN{OFS="\t"}{if($3>=450) print $1,$2}' | sed -e "s/^>>//g" -e "s/|ENSMUST[0-9]\+//g" | gzip > merged.gz
./CreateFiles
