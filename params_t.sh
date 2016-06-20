#!/bin/bash


function main () {
  ARGV="$@"

  if ! getOptParams=$(getopt -o "a:b:c:" -- "${ARGV}") ; then
    echo "fail"
    exit 1
  fi

  eval a_getOptParams=("${getOptParams}")

  ii=0
  for i in "${a_getOptParams[@]}"; do
    echo "param #${ii}: \"${i}\""
    ((ii++))
  done

}

main "$@"
