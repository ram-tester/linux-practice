#!/bin/bash/
echo "Enter A Number: "
read -s n
arm=0
num=$n
while [ $n -gt 0 ]
do
    r=$(($n % 10))
    cube=$((r*r*r))
	arm=$((arm + cube))
	n=$(($n / 10))
done
echo "after loop arm: $arm"
if [ $arm -eq $num ]
then
	echo "given num is Armstrong :$num"
else
	echo "Not Armstrong: $num"
fi