#!/bin/bash

NUMBER=$1

if [ $NUMBER -ge 10 ]
then
  echo "number is  greater than 10"
elif [ $NUMBER -le 20 ]; then echo "number is less than 10"
else
  echo "not a number"
fi