time me

this program logs how long you spend on a task in a file - log.
a current task is recorded with the "start" parameter
a current task is ended and saved in the log with the "end" parameter

arguments:
start - start a new task to be recorded
end   - end task. save task description and amount of time spent
read  - read a list of past tasks completed
clear - erase the log of tasks completed
* this menu will be printed when no arguements are passed

example use:
user@linux:~/bin/timer$ timeme start
- - -- -- - -- -- - - - -- - - -- - -- - -- -- - -- - - -

 whaat are you up to?
 :> washing dishes
 start washing dishes at 17:47:51?
 :> yes
 saved

user@linux:~/bin/timer$ timeme end
- - -- -- - -- -- - - - -- - - -- - -- - -- -- - -- - - -

 You spent 0 hours, 7 minutes, and 35 seconds with this task:
 "washing dishes"

 would you like to exit and log task?
 :> yes
 task logged and exited

user@linux:~/bin/timer$ timeme read
- - -- -- - -- -- - - - -- - - -- - -- - -- -- - -- - - -

 0:13:49 - eating dinner
 0:7:35 - washing dishes




 TODO:
 better parameters will most likely be added so that this program may be used in automation