DIX=/Users/john/repositories/apertium-mlt/apertium-mlt.mlt.dix
BIN=/Users/john/repositories/apertium-mlt/mlt.automorf.bin
cat mlt.crp.txt | cut -f2 | grep -v '>(' | sed 's/&lt;/</g' | sed 's/&gt;/>/g' | apertium-destxt | lt-proc -w $BIN | apertium-retxt | sed 's/\$\W*\^/$\n^/g' > /tmp/mlt.coverage.txt

EDICT=`cat $DIX | grep '<e lm' | wc -l`;
EPAR=`cat $DIX | grep '<pardef n' | wc -l`;
TOTAL=`cat /tmp/mlt.coverage.txt | wc -l`
KNOWN=`cat /tmp/mlt.coverage.txt | grep -v '*' | wc -l`
COV=`calc $KNOWN / $TOTAL`;
DATE=`date`;

echo -e $DATE"\t"$EPAR":"$EDICT"\t"$KNOWN"/"$TOTAL"\t"$COV >> history.log
tail -1 history.log
