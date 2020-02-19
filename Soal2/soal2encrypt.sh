#!/bin/bash

array=()
for i in {a..z} {A..Z} {0..9};
do
array[$RANDOM]=$i
done
name="$(echo $* | awk -F "." '{print $1}')"
hr=`date +"%H"`
caps=({A..Z})
nocaps=({a..z})
big=${caps[$hr]}
bigmin=${caps[$hr-1]}
small=${nocaps[$hr]}
smallmin=${nocaps[$hr-1]}
title="$(echo "$name" | tr [A-Z] ["$big"-ZA-"$bigmin"] | tr [a-z] ["$small"-za-"$smallmin"])"
printf %s ${array[@]::28} $'\n' >> "$title".txt
