#!/bin/bash 

# TODO: translate to Japanese
# check if the update flag exists
if [ -f ${UPDATE_FLAG} ]; then
    # fail
    echo "Update is not finished."
    zenity --question --no-wrap \
    --text="<span font='16'>The UI update is not finished.\n Would you like to reboot the computer to update it?</span>"\
    --ok-label="Reboot NOW" --cancel-label="Reboot LATER"
    
    # 0: reboot now, 1: reboot later
    ANSWER=$?
    if [ ${ANSWER} -eq 0 ]; then
        # no need to restore the backup?
        sudo reboot
        echo "Rebooting..."
    else
        # restore the backups of previous version
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
            # Is "sudo" neccessary?cc 
            ln -fsn ${BACKUP_DIR}/${split[0]} ${split[1]}
            
        done
        zenity --info --no-wrap --text="<span font='16'>The current UI is not up-to-date.\n The update will be executed at the next reboot.</span>"
    fi
fi

systemctl --user stop check_update.service
echo "Check_update.serice is done."