#!/bin/bash
make clean 2>/dev/null >/dev/null
make 2>/dev/null >/dev/null

if [ "$#" -eq 1 ]
then
	echo "Showing "$1" score(s) and seeds"
	echo "------"
	if [ -e ./score.txt ]
	then
		rm score.txt
	fi
	for (( i = 0; i < $1; i++ ))
	do
		./test-predict 2>intermediate.txt
		seed=$(head -1 intermediate.txt | cut -d' ' -f4)
		score=$(tail -1 intermediate.txt | cut -d'=' -f2)
		val=$(echo $score | head -c 5 | tail -c 1)
		if [ $val = "5" ]
		then
			echo "Seed: "$seed | tee -a score.txt
			echo "Score: "$score | tee -a score.txt
			echo "------" | tee -a score.txt
		fi
	done
else
	echo "Please enter a number as a command line argument"
fi
