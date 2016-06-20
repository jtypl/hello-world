#!/bin/bash

if [ "$1" = "-f" ]; then
  echo "$0 - failing intentionaly"
  exit 1
else
  echo "$0 - OK"
fi
