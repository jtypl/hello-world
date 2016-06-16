#!/bin/bash

debug="1"

function helpDie() {
  echo "This is help" 1>&2
  [ -n "$1" ] && echo "reason: $@"
  exit
}

function dumpVar() {
 if [[ "${debug}" ]]; then
   echo $1=\"$(eval echo -n '$'$1)\"
 fi
}

function parseCommandLine () {
  declare -a la_options=($(getopt -o c::shH -- $@))
  if [ $? -ne 0 ]; then
    helpDie
  fi

  cnt=0
  for i in ${la_options[@]}; do
    echo "option #${cnt}: ${i}"
    if [ "${i}" == "''" ]; then
      echo "empty option# ${i}"
    fi
    ((cnt++))
  done
}

function main () {
  parseCommandLine "$@"
}

main "$@"
