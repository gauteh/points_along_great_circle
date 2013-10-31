#! /bin/bash
#
#

awk -F" " '{
printf $2" "$1
for (i = 2; ++i <= NF;)
  printf " "$i

 printf "\n"
}' $1

