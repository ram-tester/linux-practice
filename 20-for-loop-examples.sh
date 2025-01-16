NUMBER=$1
res=0
NUMBER1=$1
for i in {1..NUMBER}
do
    rem=$NUMBER%10
    cube=$rem*$rem*$rem
    res=$res+$cube
    NUMBER=$NUMBER/10
done
echo $res
if $res==$NUMBER1
then
    echo "given num is armstrong $res"
else
    echo "not a armstrong...$res"
fi