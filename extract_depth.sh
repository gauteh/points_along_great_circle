#! /bin/bash
#
# Author: Gaute Hope <gaute.hope@nersc.no> / 2013-10-30
#
# get depth at track 

# load common
selfd=$(dirname $0)
. "${selfd}/common.sh"

grdtrack -G$ibcaogrd $1

