#!/bin/bash 

# TODO: translate to Japanese
# check if the update flag exists
if [ -f ${UPDATE_FLAG} ]; then
    # fail
    echo "Update is not finished."
    zenity --question --no-wrap \
    --text="<span font='14'>The UI update is not finished.\n Would you like to reboot the computer to update it?</span>"\
    --ok-label="Reboot NOW" --cancel-label="Reboot LATER"
    
    # 0: reboot now, 1: reboot later
    ANSWER=$?
    if [ ${ANSWER} -eq 0 ]; then
        # no need to restore the backup?
        # sudo reboot
        echo "Rebooting..."
    else
        # TODO: restore the backups of previous version
        zenity --info --no-wrap --text="<span font='14'>The current UI is not up-to-date.\n The update will be executed at the next reboot.</span>"
    fi
fi

systemctl --user stop check_update.service
echo "Check_update.serice is done."