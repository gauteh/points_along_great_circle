#! /bin/bash
#
# Author: Gaute Hope <gaute.hope@nersc.no> / 2013-10-30
#
# output points along great circle segments between points in input file

# load common
selfd=$(dirname $0)
. "${selfd}/common.sh"

# resolution
distance=0.500

# read points
a=0
while read line; do
  if [ $(echo $line | tr -d ' ') != '' ]; then
    lat[$a]=$(echo $line | awk -F" " '{ print $1 }')
    lon[$a]=$(echo $line | awk -F" " '{ print $2 }')
    let a++
  fi
done < <(cat $1)

# calculate great circle between each segment
b=1
while [ $b -lt $a ]; do
  let c=b-1
  echo "calculating great circle segment between point $c and $b: (${lon[$c]}/${lat[$c]} and ${lon[$b]}/${lat[$b]}).." 1>&2
  project -C${lon[$c]}/${lat[$c]} -E${lon[$b]}/${lat[$b]} -G${distance} -Q
  let b++
done

