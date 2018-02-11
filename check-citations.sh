#!/bin/sh -eu

find . -name '*.tex' | xargs grep -Pho 'cite\{\K([^}]*)' | sort | uniq > /tmp/bib-expected
grep -Pho '@[^\{]*\{\K[^,]*' library.bib | sort > /tmp/bib-defined

for line in $(cat /tmp/bib-expected); do
	grep "$line" /tmp/bib-defined 1>/dev/null || echo "Citation $line not defined in library.bib"
done

for line in $(cat /tmp/bib-defined); do
	grep "$line" /tmp/bib-expected 1>/dev/null || echo "Citation $line not used!"
done