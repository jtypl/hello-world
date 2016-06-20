#!/bin/bash 

debug=1

gsScriptName=$(basename "$0")
gbRunFromStdIn=0
gbRunFromCommand=0
gsCommand=

function dumpVar () {
 if [[ "${debug}" ]]; then
   echo $1=\"$(eval echo -n '$'$1)\" >&2
 fi
}

function dumpMsg () {
 if [[ "${debug}" ]]; then
   echo "$@" >&2
 fi
}

function helpDie () {
  echo >&2
  echo "Script usage:" >&2 
  echo " ${gsScriptName} [-c command]" >&2 
  echo " If no command is specified commands are read and executed from stdin" >&2 
  echo >&2
  exit 1
}

function myDie () {
  echo "FAILED: $@" >&2
  exit 1
}

function parseCmdlineParams () {
  ARGV="$@"
  OPTION_STRING="c:"
  declare -a lsOptions

  if ! lsOptions=$(getopt -o "${OPTION_STRING}" -- "${ARGV}") ; then
    helpDie
  fi
  eval set -- "${lsOptions}"

  while true ; do 
    if [ "$1" = "-c" ]; then
      gbRunFromCommand=1
      if [ ! -z "$2" ]; then
        gsCommand="$2"
        dumpVar gbRunFromCommand
        dumpVar gsCommand
	break
      else 
        helpDie "Atribute for option -c is not set."
      fi
    else 
      gbRunFromStdIn=1
      break
    fi
  done
}    

function checkEnvironment () {
  if [ -z "${JOB_NAME}" ]; then
    myDie "Variable JOB_NAME is not set or empty" 
  fi     

  if [ -z "${WORKSPACE}" ]; then
    myDie "Variable WORKSPACE is not set or empty" 
  fi     
}

function main () {

  parseCmdlineParams "$@"

  checkEnvironment

  # Start cbsdev contaner
  if  ! ./init_cbsdev.sh  ; then
    myDie "init_cbsdev.sh"
    exit 1;
  fi

  # Call the container and execute the command
  COMMAND_PREF="cd /home/u/develop/jobs/$JOB_NAME/workspace;"

  if [ "${gbRunFromCommand}" -eq 1 ]; then 
    dumpMsg "runnning \"ssh -p 2222 u@127.0.0.1\""
    dumpMsg "with string: \"${COMMAND_PREF}" "${gsCommand}\"" 
  elif [ "${gbRunFromStdIn}" -eq 1 ]; then 
    dumpMsg "runnning \"ssh -p 2222 u@127.0.0.1\""
    dumpMsg "with string: \"${COMMAND_PREF}" "$(cat)\"" 
  fi
  
  #ssh -p 2222 u@127.0.0.1 "cd /home/u/develop/jobs/$JOB_NAME/workspace; source ./jenkins/jen_parameters.sh; source ./jenkins/leveris_testdeploy.sh;"  

}

main "$@"
