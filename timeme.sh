#!/bin/bash

echo "- - -- -- - -- -- - - - -- - - -- - -- - -- -- - -- - - -"
echo



if [ -z "$1" ]
  then
  	echo " 		time me "
  	echo " commands:"
  	echo " start - start a new task to be recorded"
  	echo " end   - end task. save task description and amount of time spent"
  	echo " read  - read a list of past tasks completed"
  	echo " clear - erase the log of tasks completed"


elif [ "$1" == 'start' ]
  then
	# cheching file for previous start

	if [ ! -f ./start ]
		then
			echo " welcome to timeme"   
			echo 
	else
		k=0
		while read line; do
	        if [ $k == "0" ]
	        then
	          	t_start=$line
	          	((k++))  
	        else
	          	r_start=$line
	        fi
		done < start
	fi


	if [ -z "$t_start" ]; 
	  then 	
		t_start=$(date +"%s")
		r_start=$(date +"%T")
	else
		echo " youre already doing something: \"$r_start\""
		echo	
		exit
	fi

	# getting new task from user
	echo " whaat are you up to?"
	printf " :> "
	read task

	# verifying new task and saving
	echo " start '$task' at $r_start?"
	printf " :> "
	read ver
	if [ "$ver" == "yes" ]
	  then
	  	echo "$t_start" >> ./start
	  	echo "$task" >> ./start
	  	echo " saved"
	else
		echo " not saved"
	fi

elif [  "$1" == 'end' ]
  then
	k=0
	while read line; do
        if [ $k == "0" ]
        then
          	t_start=($line)
          	((k++))  
        else
          	r_start=$line
        fi
	done < start

	if [ -z "$t_start" ]; 
	  then
		echo " youre not doing anything"
		echo
		exit
	else
		timenow=$(date +"%s"); 			timespent=$(($timenow-$t_start))
		hours=$(expr $timespent / 3600);timespent=$(expr $timespent % 3600)
		minutes=$(expr $timespent / 60);timespent=$(expr $timespent % 60)
		seconds=$timespent
		echo " You spent $hours hours, $minutes minutes, and $seconds seconds with this task:"
		echo " \"$r_start\""
		echo

		# asking to save and exit
		echo " would you like to exit and log task?"
		printf " :> "
		read ver
		if [ "$ver" == "yes" ]
		  then
		  	echo " $hours:$minutes:$seconds - $r_start" >> ./log
		  	> ./start
		  	echo " task logged and exited"
		else
			echo " continuing task"
		fi
	fi

elif [  "$1" == 'read' ]
  then
	while read line; do
		echo $line
	done < log


elif [  "$1" == 'clear' ]
  then
	echo " this will completely erase your task log"
	echo " are you sure you would like to erase everything?"
	printf " :> "
	read ver
	if [ "$ver" == "yes" ]
	  then
	  	> ./log
	  	echo " log has been emptied"
	else
		echo " log not erased"
	fi

else
	echo " X.) could not use arguement provided"
	echo
  	echo " commands:"
  	echo " start - start a new task to be recorded"
  	echo " end   - end task. save task description and amount of time spent"
  	echo " read  - read a list of past tasks completed"
  	echo " clear - erase the log of tasks completed"

fi

echo
