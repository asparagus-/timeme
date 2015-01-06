#!/bin/bash

# must change to install directory
wdir="$HOME/bin/timer"

echo "- - -- -- - -- -- - - - -- - - -- - -- - -- -- - -- - - -"
echo

# program called with no parameters
if [ -z "$1" ]
  then
  	echo " 		time me "
  	echo " commands:"
  	echo " start - start a new task to be recorded"
  	echo " end   - end task. save task description and amount of time spent"
  	echo " read  - read a list of past tasks completed"
  	echo " clear - erase the log of tasks completed"


# program called with start parameter
elif [ "$1" == 'start' ]
  then

	# first time running timeme or no start file available
	if [ ! -f "$wdir/start" ]
		then
			echo " welcome to timeme"   
			echo 

	# getting current task if there is one
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
		done < "$wdir/start"
	fi

	# if there is no current task
	if [ -z "$t_start" ]; 
	  then 	
		t_start=$(date +"%s")
		r_start=$(date +"%T")

	# there is a current task
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
	  	echo "$t_start" >> "$wdir/start"
	  	echo "$task" >> "$wdir/start"
	  	echo " saved"
	else
		echo " not saved"
	fi

# program called with end parameter
elif [  "$1" == 'end' ]
  then
  	# reading current task
	k=0
	while read line; do
        if [ $k == "0" ]
        then
          	t_start=($line)
          	((k++))  
        else
          	r_start=$line
        fi
	done < "$wdir/start"

	# no current task - exiting program
	if [ -z "$t_start" ]; 
	  then
		echo " youre not doing anything"
		echo
		exit
	else
		# parsing seconds into hours, minutes, and seconds 
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
		  	# writing task to log and exiting
		  	echo " $hours:$minutes:$seconds - $r_start" >> "$wdir/log"
		  	> "$wdir/start"
		  	echo " task logged and exited"
		else
			# user would not like to end task. exiting
			echo " continuing task"
		fi
	fi

# program called with "read" parameter
elif [  "$1" == 'read' ]
  then
	while read line; 
	  do
		echo $line # reading log line by line
	done < "$wdir/log"


# program called with "clear" parameter
elif [  "$1" == 'clear' ]
  then
	echo " this will completely erase your task log"
	echo " are you sure you would like to erase everything?"
	printf " :> "
	read ver
	if [ "$ver" == "yes" ]
	  then
	  	> "$wdir/log"	# clearing log
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

fi # end program
echo
