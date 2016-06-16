#!/bin/bash

debug="1"

function dumpVar() {
 if [[ "${debug}" ]]; then
   echo $1=\"$(eval echo -n '$'$1)\"
 fi
}

function moje () {
  local a=60
  dumpVar "a"
}

declare -a losna=("alsona" "b" "c")

dumpVar "{losna[@]:1:2}"

#  dump=a; echo $dump=\"$(eval echo -n '$'$dump)\"

exit
a=(\  
[0]=ahoj
[1]=adfas
[2]=losos
[3]=losna
[4]=maznak
);

ii=0
for i in "${a[@]}"; do 
  echo "#${ii}: ${i}"
  ((ii++))
done
