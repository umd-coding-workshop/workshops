#!/bin/bash

for file in "$@";
do
  size=$(stat -f "%z" "$file")  
  checksum=$(md5 -q "$file")
  echo -e "$file\t$size\t$checksum"
done
