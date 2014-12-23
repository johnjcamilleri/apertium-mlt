#!/bin/bash

# Use wiki file to filter dix file and then reformat as TSV
for i in `cat dev/mt_verbs/stems-loan.wiki  | grep '^| ' | cut -f2 -d '|' | tr -d ' '`; do cat apertium-mlt.mlt.dix | grep ">$i<s" | grep -v 'r="LR"' | gsed 's/<e.*><p><l>//g' | gsed 's/<\/r>.*//g' | gsed 's/<\/l><r>/\t/g' | gsed 's/<s n/\t<s n/1' | gsed 's/<s n="\([a-zA-Z0-9]\+\)"\/>/\1./g' | awk -F'\t' '{print $2"\t"$1"\t"$3}' ; done | sort -u > full-form-loans.txt
