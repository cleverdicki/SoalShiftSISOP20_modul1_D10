#!/bin/bash

name="$(echo $* | awk -F "." '{print $1}')"
hr=`date +"%H"`
caps=({A..Z})
nocaps=({a..z})
big=${caps[$hr]}
bigmin=${caps[$hr-1]}
small=${nocaps[$hr]}
smallmin=${nocaps[$hr-1]}
title="$(echo "$name" | tr ["$big"-ZA-"$bigmin"] [A-Z] | tr ["$small"-za-"$smallmin"] [a-z])"
mv $1 "$title".txt
