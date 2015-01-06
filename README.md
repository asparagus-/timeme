<b>time me</b>
============

a simple bash script which records how long you spend on a task. <br>

<br>
<b>arguments:</b><br>
start - start a new task to be recorded<br>
end   - end task. save task description and amount of time spent<br>
read  - read a list of past tasks completed<br>
clear - erase the log of tasks completed<br>
this menu will be printed when no arguements are passed<br>
<br>
<b>example use:</b><br>
user@linux:~/bin/timer$<b> timeme start</b><br>
 whaat are you up to?<br>
 :> washing dishes<br>
 start washing dishes at 17:47:51?<br>
 :> yes<br>
 saved<br>
 <br>
user@linux:~/bin/timer$<b> timeme end</b><br>
 You spent 0 hours, 7 minutes, and 35 seconds with this task:<br>
 "washing dishes"<br>
 would you like to exit and log task?<br>
 :> yes<br>
 task logged and exited<br>
<br>
user@linux:~/bin/timer$<b> timeme read</b><br>
 0:13:49 - eating dinner<br>
 0:7:35 - washing dishes<br>
<br>
 <b>TODO:</b><br>
 better parameters will most likely be added so that this program may be used in automation<br>
