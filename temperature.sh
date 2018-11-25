#!/bin/bash


for pins in {0..2} #for each of the items in the list do the following
do
		gpio mode $pins out; #here  we set it to out
		gpio write $pins 0; #here  0 is the value we set it to
		
done


initTemp=$(./tempread); #inital temp to compare to

counter=1;
pin=0;

while true #forever loop
do
	temp2=$(./tempread);
	
	diff=$(( $temp2 - $initTemp))
	echo $initTemp, $temp2, $diff ## get the difference
	
	diff=$((diff/1000)) #put the diff in ones form
	echo $diff	
	
	if [ $initTemp -eq 85000 ]
	then
		echo "temperature was not available. Check sensor and sensor power"
	fi

	if test "$diff" -ge $counter
	then
		gpio write $pin 1; #turn 1st led on

		((counter++ ))
		((pin ++))
	fi

	
done