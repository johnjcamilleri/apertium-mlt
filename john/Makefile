dix: nouns propns adjs advs


nouns:
	sed -n 4746,6628p ../apertium-mlt.mlt.dix | grep -v "<!--" | grep 'lm="' > nouns.dix

# Proper nouns, excluding names
propns:
	sed -n 6633,6877p ../apertium-mlt.mlt.dix | grep -v "<!--" | grep 'lm="' > propns.dix

adjs:
	sed -n 10329,10953p ../apertium-mlt.mlt.dix  > tmp
	sed -n 11163,11509p ../apertium-mlt.mlt.dix >> tmp
	cat tmp | grep -v "<!--" | grep 'lm="' > adjs.dix
	rm tmp

advs:
	sed -n 10958,11158p ../apertium-mlt.mlt.dix | grep -v "<!--" | grep 'lm="' > advs.dix

wordlists:
	lt-expand ../apertium-mlt.mlt.dix > wordlist.txt
	grep -v ":>:" wordlist.txt > wordlist_min.txt
	grep "<n>"    wordlist_min.txt > wordlist_min_n.txt
	grep "<np>"   wordlist_min.txt > wordlist_min_np.txt
	grep "<adj>"  wordlist_min.txt > wordlist_min_adj.txt
	grep "<adv>"  wordlist_min.txt > wordlist_min_adv.txt
