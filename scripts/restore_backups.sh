#!/bin/bash -e
# --------------------
# Restore the backups to previous version

cat $VERSION_LIST | while read line
do
    if [ -z "${line}" ] || [ "${line:0:1}" == "#" ]; then
        # comment-out
        continue
    fi
    split=($line)
    if [ ! -d "${BACKUP_DIR}/${split[0]}" ]; then
        # TODO: What shoud we do if the file doesn't exist?
        echo "${BACKUP_DIR}/${split[0]} does not exist."
        continue
    fi
    # Is "sudo" neccessary?
    # ln -fsn ${BACKUP_DIR}/${split[0]} ${split[1]}
    
done