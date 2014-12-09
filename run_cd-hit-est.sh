#!/bin/bash 
cd-hit-est -i $1 -o $2 -c 0.9 -G 0 -b 20 -n 4 -d 0 -s 0.8 -aS 0.75 -aL 0.01 -AL 4000 -AS 4000 -A 4 -B 0 -p 1 -g 1 -r 0
