#!/bin/bash

lt-expand apertium-mlt.mlt.dix | grep '<vblex>' | grep -v ':>:' | gsed 's/:<:/:/g' | sort -u > /tmp/mlt-verbs-fullform
for i in `cat dev/mt_verbs/stems-loan.wiki  | grep '^| ' | cut -f2 -d '|' | tr -d ' '`; do cat /tmp/mlt-verbs-fullform | grep ":$i<" | tr ':' '\t' | gsed 's/</\t</1' | awk -F'\t' '{print $2"\t"$1"\t"$3}' ; done | sort -u > full-form-loans-with-pronouns.txt
