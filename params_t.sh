#!/bin/bash


function main () {
  ARGV="$@"

  if ! getOptParams=$(getopt -o "a:b:c:" -- "${ARGV}") ; then
    echo "fail"
    exit 1
  fi

  eval a_getOptParams=("${getOptParams}")
  # eval files=($(\ls -Q)); for i in "${files[@]}"; do echo ${i}; done; 

  ii=0
  for i in "${a_getOptParams[@]}"; do
    echo "param #${ii}: \"${i}\""
    ((ii++))
  done

}

main "$@"
