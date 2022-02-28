#!/bin/bash
echo " " 
echo "Welcome to the Kirby Air Ride Packager, created by Eternalll#6100 for the Kirby Workshop Community. https://kirbyairri.de"
echo "With assistance from !Hibyehello#5498, knux#6598 and Majestic#3774 from the Dolphin Discord. Thank you!"
sleep 5
curl -sS 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/PackagerVersion_OSX.txt' -LO
curl -sS 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/GeckoVersion.txt' -LO
curl -sS 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/NetplayVersion.txt' -LO
echo " "
echo "The Master Server reports the following versions as the latest:"
echo " "
cat 'NetplayVersion.txt'
echo " "
cat 'PackagerVersion_OSX.txt'
echo " "
cat 'GeckoVersion.txt'
echo " "
echo " "
sleep 3
rm 'NetplayVersion.txt'
rm 'PackagerVersion_OSX.txt'
rm 'GeckoVersion.txt'
echo "The current versions of your Packager instance are:"
echo " "
cat './Sys/Resources/PackagerVersion_OSX.txt'
echo " "
cat './Sys/Resources/GeckoVersion.txt'
echo " "
echo " "
sleep 3
echo "We will now update Packager, Update Gecko Codes, and Patch Dolphin in that order."
echo " "
echo "If Packager version does not match the latest, exit and restart the script after it is updated (first step)."
echo " "
echo "You must run through all three steps your first time to patch Dolphin successfully."
sleep 5
read -p "Press Enter to update Packager"
read -p "Press Enter again to confirm you read and understand the information above"
echo "We are now updating Packager..."
curl -sS 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/PackagerVersion_OSX.txt' -LO
mv PackagerVersion_OSX.txt './Sys/Resources/'
curl -sS 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Packager_OSX.sh' -LO
echo "Packager was updated. Please exit and restart if your local version was different from the reported server version."
cd ~/'Library/Application Support/Dolphin/Gamesettings/'
read -p "Press Enter to update Gecko Codes"
echo "Updating Gecko Codes..."
curl -sS 'http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/GKYE01.ini' -LO
curl -sS 'http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/KHPE01.ini' -LO
curl -sS 'http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/modifier_guide.txt' -LO
read -p "Press Enter to patch Dolphin."
read -p "WARNING: Your existing graphics and configuration settings will be reset. This should only be run on your first setup. Press Enter to continue"
cd ~/'Library/Application Support/Dolphin/Config/'
curl -sS 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Config/Dolphin.ini' -LO
curl -sS 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Config/GFX.ini' -LO
echo "Kirby Air Ride can now be played online."
read -p "Press Enter to exit"