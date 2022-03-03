#!/bin/bash 

echo ${UPDATE_FLAG}

# TODO: translate to Japanese
# check if the update flag exists
if [ ! -f ${UPDATE_FLAG} ]; then
    # success
    notify-send 'Update' 'The UI update is completely finished. Enjoy the brand-new UI!'
else
    # fail
    notify-send 'Update' 'The UI update is not finished. Please reboot the computer.'
fi

systemctl --user disable check_update.service
echo "Check is done."