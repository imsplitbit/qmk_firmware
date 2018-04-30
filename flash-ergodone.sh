#!/bin/bash

SLEEP_SECS=15

make ergodone:imsplitbit

if [ $? -gt 0 ]
then
    echo "ERROR BUILDING FIRMWARE, FIX YO SHIT!!!"
    exit 1
fi

echo "Sudo make me a sangwich: "
sudo /bin/true

echo "SLEEPING FOR ${SLEEP_SECS}"
sleep $SLEEP_SECS


echo "Programming board, don't unplug it..."
sleep 1
sudo ../tkg-toolkit/linux/bin/hid_bootloader_cli -mmcu=atmega32u4 ergodone_imsplitbit.hex

echo "Board reprogrammed, congrats!"
