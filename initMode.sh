#!/bin/bash


pins='0 1 2' #for loop takes a list of items
for pins in $pins #for each of the items in the list do the following
do
		gpio mode $pins out; #here  we set it to out
		gpio write $pins 0; #here  0 is the value we set it to
		
		
		#((COUNTER++)) # increment counter
done

