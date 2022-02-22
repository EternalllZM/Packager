#!/bin/bash
echo "Welcome to the Kirby Air Ride Packager"
echo "Created by Eternalll#6100 for the Kirby Workshop Community"
echo "https://kirbyairri.de"
echo " " 
curl 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/PackagerVersion_OSX.txt' -o 'PackagerVersion_OSX.txt'
curl 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/GeckoVersion.txt' -o 'GeckoVersion.txt'
echo " "
echo " - - - - - IMPORTANT PLEASE READ - - - - -"
echo " "
echo "The Master Server reports the following versions as the latest:"
echo " "
cat 'PackagerVersion_OSX.txt'
echo " "
cat 'GeckoVersion.txt'
echo " "
echo " "
rm 'PackagerVersion_OSX.txt'
rm 'GeckoVersion.txt'
echo "The current versions of your Packager are:"
echo " "
cat './Sys/Resources/PackagerVersion_OSX.txt'
echo " "
cat './Sys/Resources/GeckoVersion.txt'
echo " "
echo " "
echo "We will now update Packager, Update Gecko Codes, and Patch Dolphin in that order."
echo " "
echo "If your local version of Packager does not match the one reported by the Master Server, please exit out once this first part is done."
echo "If this is your first time running the script, you will not have local versioning available yet. However, you will be fully updated by default."
echo " "
echo "You may stop the script at any time after each process if you do not want to perform the next step. You must run through all three steps your first time."
read -p "Press Enter to update Packager"
read -p "Press Enter again to confirm you read and understand the information above"
echo "We are now updating Packager..."
sleep 2
curl 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/PackagerVersion_OSX.txt' -o 'PackagerVersion_OSX.txt'
mv PackagerVersion_OSX.txt './Sys/Resources/'
curl 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Packager_OSX.sh' -o 'Packager_OSX.sh'
echo "Packager was updated. If your local version reported differently, please quit and restart the script to receive the latest fixes and updates."
cd ~/'Library/Application Support/Dolphin/Gamesettings/'
read -p "Press Enter to update Gecko Codes"
echo "Updating Gecko Codes..."
sleep 1
curl 'http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/GKYE01.ini' -o 'GKYE01.ini'
curl 'http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/KHPE01.ini' -o 'KHPE01.ini'
curl 'http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/modifier_guide.txt' -o 'modifier_guide.txt'
echo "Kirby Air Ride can now be played online."
echo "We are done."
read -p "Press Enter to exit"