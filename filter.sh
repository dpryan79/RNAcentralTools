#!/bin/bash
#zcat output????.gz | awk 'BEGIN{OFS="\t"}{if($3>=600) print $1,$2,$3}' | sed -e "s/^>>//g" -e "s/|ENSMUST[0-9]\+//g" | gzip > merged.gz
zcat output????.gz | awk 'BEGIN{OFS="\t"}{if($3>=450) print $1,$2}' | sed -e "s/^>>//g" -e "s/|ENSMUST[0-9]\+//g" | gzip > merged.gz
#./annotate.R
./CreateFiles
