#!/bin/bash
if [ $# != 1 ]
then
	echo "ERROR! Improper Argument List"
	exit 1
else
    if [ -d $1 ]
    then
        cd $1
        echo 'These files are unreadable:- '
        for item in * .* # .* satisfies filename with "."
        do
            if [ -f "$item" ] # satisfies regular file constraint "" helps in filenames with space and asterisk
            then
                md5sum "$item" >> mdresult
            fi
        done
        # stores unique hash values 
        dup_hash_all=($(cat mdresult | sort | uniq -w32 -d | cut -b 1-32))
        for ((i = 0 ; i < ${#dup_hash_all[*]} ; i++)); do
            cat mdresult | grep "${dup_hash_all[i]}" | sort #| head -n 1 | cut -b 35-
            ########################################################
        done
        rm mdresult
    else
        echo "Directory does not exist"
    fi
fi