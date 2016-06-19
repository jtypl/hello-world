#!/bin/bash

test_a=(
  losna
  maznak
  krout
  pako
);

ii=0
for i in ${test_a[*]:1};
  do echo "element #${ii}: ${i}"
  ((ii++))
done

OPT_STRING="cdefgh"
ii=0
while getopts ${OPT_STRING} opt ; do
  echo "option #" ${opt}
  ((ii++))
done
