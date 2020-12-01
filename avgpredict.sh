#!/bin/bash
make clean 2>/dev/null >/dev/null
make 2>/dev/null >/dev/null


if [ $# -eq 1 ]
then
	echo "Averaging $# scores"
	if [ -e ./score.txt ]
	then
		rm score.txt
	fi
	for (( i = 0; i < $1; i++ ))
	do
		score=$(./test-predict 2>&1 | tail -1 | cut -d'=' -f2)
		echo $score | tee -a score.txt
	done
	gcc -o avg avg.c
	./avg
else
	echo "Please enter a number as a command line argument"
fi
