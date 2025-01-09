#!/bin/bash

echo "all varibales are passed:$@"
echo "no of varibales :$#"
echo "script name:$0"
echo "present workfing dir:$PWD"
echo "home directory of current user:$HOME"
echo "which user running this script:$USER"
echo "process id of current script:$$"
sleep 60 &
echo "process id of last command in background:$!"