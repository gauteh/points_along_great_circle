#! /bin/bash
#
# Author: Gaute Hope <gaute.hope@nersc.no> / 2013-10-30
#
# get depth at track 

# load common
selfd=$(dirname $0)
. "${selfd}/common.sh"

${selfd}/geo2cart.sh $1 | grdtrack -G$ibcaogrd

