#!/bin/bash
#This bash script controls starting and stopping of the Appium server

start=start
start_reset=start_reset
stop=stop
restart=restart
restart_reset=restart_reset
status=status

echo server $1 executed..

if [ $1 == $start ]; then

     nohup appium &
     sleep 1
     
elif [ $1 == $start_reset ]; then

     nohup appium --full-reset &
     sleep 1
elif [ $1 == $stop ]; then

     killall node
    ## ps aux | grep appium | awk {'print $2'} | xargs kill -9
     sleep 1

elif [ $1 == $restart ]; then

     killall node
     sleep 4
     nohup appium &
     sleep 1

elif [ $1 == $restart_reset ]; then

     killall node
     sleep 4
     nohup appium --full-reset &
     sleep 1

elif [ $1 == $status ]; then

    ps ax | grep appium

else
    echo "Please enter a command [start|restart|stop|status]"
fi