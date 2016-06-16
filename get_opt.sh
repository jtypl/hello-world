#!/bin/bash


function helpDie() {
  echo "This is help" 1>&2
  echo "diing because: $@"
  exit
}

declare -a la_options
la_options=($(getopt -o a::b:d -- $@ 2> /dev/null))
if [ $? -ne 0 ]; then
  optionsErr=$((getopt -o a::b:d -- $@ > /dev/null) 2>&1) 
  helpDie ${optionsErr}
fi

i=0
while [ ! -z "${la_options[${i}]}" ]; do
  echo "option #${i}: ${la_options[${i}]}"
  if [ -z ${la_options[${i}]} ]; then
    echo "empty option #${i}"
  fi
  if [ "${la_options[${i}]}"  == "''" ]; then
    echo "empty option #${i}"
  fi
  ((i++))
done
