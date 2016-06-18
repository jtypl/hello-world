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
  ARGV=$@
  OPTION_STRING="c::shH"
  if ! la_options=($(getopt -o ${OPTION_STRING} -- ${ARGV})) ; then
    helpDie
  fi

  while [[ ${la_options[$i]} ]]; do
    echo "option #${cnt}: ${la_options[$i]}"
    if [ "$i" == "''" ]; then
      echo "empty option# ${i}"
    fi
    ((i++))
  done
}

function main () {
  parseCommandLine "$@"
}

main "$@"
