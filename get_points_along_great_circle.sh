#! /bin/bash
#
# Author: Gaute Hope <gaute.hope@nersc.no> / 2013-10-30
#
# output points along great circle between points in input file

# load common
selfd=$(dirname $0)
. "${selfd}/common.sh"

# resolution
distance=0.500

a=0
while read line; do
  lat[$a]=$(echo $line | awk -F" " '{ print $1 }')
  lon[$a]=$(echo $line | awk -F" " '{ print $2 }')
  let a++
done < $1

project -C${lon[0]}/${lat[0]} -E${lon[1]}/${lat[1]} -G${distance} -Q

