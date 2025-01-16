NUMBER=$1
res=0
NUMBER1=$1
while [ $NUMBER1 -ge 0 ]
do
    rem=$((NUMBER%10))
    cube=$((rem*rem*rem))
    res=$((res+cube))
    NUMBER=$((NUMBER/10))
done
echo $res
if [ $res --eq $NUMBER1 ]
then
    echo "given num is armstrong $res"
else
    echo "not a armstrong...$res"
fi