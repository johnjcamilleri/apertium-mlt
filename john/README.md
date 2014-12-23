# Explanation of all the stuff going on in this here

John 2014-12-19 (after meeting with Francis Tyers)

TODO 2014-12-19
====

1. For Francis: Full form list from Ġabra with format:
       angol	angolu	n.m.sg.
       angol	angoli	n.m.pl.
1. For all non-verb entries in Apertium, see how many are in Ġabra, and for those which are, check the wordforms.
1. Insert non-verb entries from A to Ġ. There will be collisions (see above).
1. Insert all loan verbs from Apertium (61) into Ġabra, with full inflections. There should be no collisions.

Lexicon
=======

`apertium-mlt.mlt.dix` is lexicon.
All tags are defined in the top `<sdefs>` section.

## For verbs
These are generated from `dev/mt_verbs/*.wiki` using:

And inserted into the dix file as full forms (minus enclitic pronouns).
Except that enclitic pronouns are still handled by paradigms such as `S__fetaħ/ni`

## For everything else
The paradigms are defined in the dix file, e.g.

    <pardefs>
      ...
      <pardef n="buff/u__n_m">
        <e><p><l>u</l><r>u<s n="n"/><s n="m"/><s n="sg"/></r></p></e>
        <e><p><l>i</l><r>u<s n="n"/><s n="m"/><s n="pl"/></r></p></e>
      </pardef>

e=entry, p=pair, l=left, r=right, s=symbol
Then the entries use this paradigm:

    <section id="main" type="standard">
      ...
      <e lm="teatru" c="theatre"><i>teatr</i><par n="buff/u__n_m"/></e>
      <e lm="santwarju" c="shrine"><i>santwarj</i><par n="buff/u__n_m"/></e>
      <e r="RL"><p><l><a/>indikaw</l><r>indika<s n="vblex"/><s n="tv"/><s n="pres"/><s n="p3"/><s n="mf"/><s n="pl"/></r></p></e>

lm=lemma (ignored), c=comment, i=identity
r="LR" only include when compiling left to right (also RL)

<a/> is an alert, which in our case indicates that the i may be dropped (this should be implemented in `apertium-mlt.post.dix` but isn't yet).

Note that possessive enclitic pronouns for nouns are included as part of the paradigm! Look for `px...` tags.

Commands
========

## Compile morpho analyser into HFST (producing mlt.automorf.bin file)
lt-comp lr apertium-mlt.mlt.dix mlt.automorf.bin apertium-mlt.mlt.acx

## Run the analyser from stdin
... | lt-proc -w mlt.automorf.bin

## Show HFST as TSV
lt-print mlt.bin

## Generate full list of wordforms (applying all paradigms)
lt-expand apertium-mlt.mlt.dix

Scripts and other files
=======================

## full-form-loans.sh (output in *.txt)
Use the `stems-loan.wiki` file to filter the dix file, then format the output as TSV.
Note this does not require calling lt-expand.

## full-form-loans-with-pronouns.sh (output in *.txt)
As above, but since we want the enclitic versions too we need to run lt-expand.
The output format is slightly different.

## `coverage.sh`
Process a corpus with lt-proc and report the coverage

## `new-parade.sh`
Rank unknown words (requires `coverage.sh` is run first to generate `/tmp/mlt.coverage.txt`).

## wordlist.txt
Output from lt-expand

## dixcounter.py
From <http://wiki.apertium.org/wiki/The_Right_Way_to_count_dix_stems>

## lexccounter.py
From <http://wiki.apertium.org/wiki/The_Right_Way_to_count_lexc_stems>
