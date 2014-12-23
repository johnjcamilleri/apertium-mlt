nouns:
	sed -n 4746,6615p ../apertium-mlt.mlt.dix > nouns.dix
	grep 'lm="' nouns.dix > tmp
	mv tmp nouns.dix

# Proper nouns, excluding names
propns:
	sed -n 6619,6949p ../apertium-mlt.mlt.dix > propns.dix
	grep 'lm="' propns.dix > tmp
	mv tmp propns.dix

adjs:
	sed -n 4746,6615p ../apertium-mlt.mlt.dix > adjs.dix
	grep 'lm="' adjs.dix > tmp
	mv tmp adjns.dix
