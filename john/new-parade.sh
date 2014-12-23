cat /tmp/mlt.coverage.txt | cut -f2 -d'^' | cut -f1 -d'/' | sort -f | uniq -c | sort -gr  | grep -v '[0-9] [0-9]' > mlt.hitparade.txt
