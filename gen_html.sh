#!/bin/bash


OUTFILE="c:/temp/pokus.html"
gsOutPath="C:/"
gsInPath="/c/"


function addToOutFile () {
  if [ -z "$*" ]; then
    echo "$(cat)" >> "${OUTFILE}"
  else
    echo "$@" >> "${OUTFILE}"
  fi
}

function startDocument() {
  if [ -f "${OUTFILE}" ]; then
    rm "${OUTFILE}"
  fi

addToOutFile <<EOF 
<!doctype HTML>
<head>
</head>
<body>
EOF
}

function endDocument() {
  addToOutFile <<EOF
</body>
EOF
}

function genDirectory() {
  isDir=$1

  lsDir=$(realpath "$1")
  lsWinDir=$(echo ${lsDir} | sed "s#${gsInPath}#${gsOutPath}#")

  # Get the files list
  eval laFiles=($(ls -Q ${lsDir}))

  # Generate the directory header
  addToOutFile "Directory: <a href=\"file:///${lsWinDir}\">${lsWinDir}</a><br />"
  addToOutFile "<br />"
  # Generate the links
  for i in "${laFiles[@]}"; do 
    if [ "${i##*.}" = "txt" ]; then
      addToOutFile "<a href=\"file:///${lsWinDir}/${i}\">${i}</a><br />"
    else
      addToOutFile "${i}" "-" "<br />"
    fi
  done
}

main() {
  startDocument
  genDirectory .
  genDirectory ..
  endDocument
}

main "$*"
