#!/bin/bash
if [ $# != 1 ]
then
    echo "ERROR! Improper Argument List"
    exit 1
else
    if [ -d $1 ]
    then
        cd $1
        for item in * .* # .* satisfies filename with "."
        do
            if [ -f "$item" ] # satisfies regular file constraint "" helps in filenames with space and asterisk
            then
                md5sum "./$item" >> mdresult  # The ./ handles - type files
            fi
        done
        # stores unique hash values 
        dup_hash_all=($(cat mdresult | sort | uniq -w32 -d | cut -b 1-32))
        for ((i = 0 ; i < ${#dup_hash_all[*]} ; i++)); do
           cat mdresult | grep "${dup_hash_all[i]}" | sort | cut -d " " -f 3- > allFiles
           # convert contents of allFiles file into array
           mapfile allFilesArray < allFiles
           # trim unwanted newline character from the end.
           allFilesArray[0]=$(echo "${allFilesArray[0]}" | tr -d '\n')
           for((j = 1; j < ${#allFilesArray[@]}; j++))
           do
             # trim unwanted newline character from the end.
             allFilesArray[j]=$(echo "${allFilesArray[j]}" | tr -d '\n')
             # remove the duplicate file
             rm "${allFilesArray[j]}"
             # create hardlink
             ln "${allFilesArray[0]}" "${allFilesArray[j]}" 
             echo "${allFilesArray[j]} has been hard linked to ${allFilesArray[0]}"
           done
        done
        # removing extra files.
       rm mdresult
       rm allFiles
    else
        echo "Directory does not exist"
    fi
fi