#!bin/bash/

mkdir kenangan
mkdir duplicate
for ((i=1; i<=28; i++))
do
wget -a wget.log https://loremflickr.com/320/240/cat -O pdkt_kusuma_$i.jpg
done

grep "Location" wget.log > location.log
readarray line < location.log
for ((i=0; i<28; i++))
do
for ((j=0; j<=i; j++))
do
if [ $i == $j ]
then
continue
elif [ "${line[$i]}" == "${line[$j]}" ]
then
mv pdkt_kusuma_"$(($i+1))".jpg ./duplicate/duplicate_"$i".jpg
fi
done
done

for ((i=1; i<=28; i++))
do
mv pdkt_kusuma_"$i".jpg ./kenangan/kenangan_"$i".jpg
done
cp wget.log wget.log.bak
