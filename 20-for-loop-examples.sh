NUMBER=$1
res=0
NUMBER1=$NUMBER
while [ $NUMBER1 -ge 0 ]
do
    rem=$((NUMBER%10))
    cube=$((rem*rem*rem))
    res=$((res+cube))
    NUMBER=$((NUMBER/10))
done
echo $res
if $res==$NUMBER1
then
    echo "given num is armstrong $res"
else
    echo "not a armstrong...$res"
fi