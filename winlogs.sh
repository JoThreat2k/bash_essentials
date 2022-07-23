#!/bin/bash -
# Description: Gather copies of Windows log files
#Usage:
# winlogs.sh [-z][dir]
#   -z  -> Tar and zip the output 
#   dir -> Optional scratch directory for holding log files

#creates the TGZ flag
TGZ=0
#if number of user given arguments are greater than 0 
if (( $# > 0 ))
    then
        #if the 1st argument that is 2 bytes long at the zero index is -z 
        if [[ ${1:0:2} == '-z' ]]
            then
                #set the TGZ flag to 1 which tar/zips the files later in script
                TGZ=1
                shift
        fi
elif (( $# == 0 ))
    then
    echo "Usage: winlogs.sh [-z][dir] \n"
    echo "-z  -> Tar and zip the output \n"
    echo "dir -> Optional scratch directory for holding log files"

fi

# a variable for hostname of target machine
SYSNAM=$(hostname)
#if no directory specified after script then make a tmp directory by default with the name of the target system
LOGDIR=${1:-/tmp/${SYSNAM}_logs}
mkdir -p $LOGDIR

#enter new tmp directory or exit with error code
cd ${LOGDIR} || exit -2

#list all possible logfiles & pipe the output into a while loop that reads 1 line aka log filename at a time
wevutil el | while read ALOG
do
    #replace the newline character after each line of the wevutil output with a return character
    ALOG="${ALOG%$ '\r'}"
    #echo a filename to show progress to the user and which file is being fetched
    echo "${ALOG}:"
    #replaces spaces in every new filename with underscore
    SAFNAM="${ALOG// /_}"
    #replaces every backslash in filename with dash 
    SAFNAM="${SAFNAM//\//-}"
    #output wevutil output with cleaned filename
    wevutil wpl "$ALOG" "${SYSNAM}_${SAFNAM}.evtx"
done 

if (( TGZ == 1 ))
    then
        tar -czvf ${SYSNAM}_logs.tgz *.evtx
fi
