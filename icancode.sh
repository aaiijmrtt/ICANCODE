#!/bin/bash

A="111101111101101"
B="111101111101111"
C="111100100100111"
D="100110101110100"
E="111100111100111"
F="111100110100100"
G="111100101101111"
H="101101111101101"
I="111010010010111"
J="111001001001110"
K="101110100110101"
L="100100100100111"
M="101111101101101"
N="111101101101101"
O="111101101101111"
P="111101111100100"
Q="111101101111111"
R="111101111110101"
S="111100111001111"
T="111010010010010"
U="101101101101111"
V="101101101101010"
W="101101101111101"
X="101101010101101"
Y="101101111010010"
Z="111001010100111"

offset=$(($(date "+%u")-2))

date -s "1 year ago"
date -s "14 days"
date -s "$offset days ago"

for (( j=0; j<${#1}; ++j)); do

	character=$(echo ${1:$j:1} | tr '[:lower:]' '[:upper:]')
	eval "string=\${${character}}"

	for (( i=0; i<${#string}; i++ )); do

		case ${string:$i:1} in
			'1')	git commit --allow-empty -m "$string $i";;
		esac

		if [[ $(($i % 3)) = 2 ]]; then
			date -s "13 days ago"
		else
			date -s "7 days"
		fi

	done

	date -s "23 days"

done

date -s "1 year"
date -s "14 days ago"
date -s "$offset days"

offset=$((28*${#1}))
date -s "$offset days ago"
