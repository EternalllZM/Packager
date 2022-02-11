#!/bin/bash
echo "Welcome to the Kirby Air Ride Packager"
echo "Created by Eternalll#6100 for the Kirby Workshop Community"
echo "https://kirbyairri.de"
echo " " 
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/PackagerVersion.txt
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/GeckoVersion.txt
echo " "
echo " - - - - - IMPORTANT PLEASE READ - - - - -"
echo " "
echo "The Master Server reports the following versions as the latest:"
echo " "
cat 'PackagerVersion.txt'
echo " "
cat 'GeckoVersion.txt'
echo " "
echo " "
rm 'PackagerVersion.txt'
rm 'GeckoVersion.txt'
echo "The current versions of your Packager are:"
echo " "
cat './Sys/Resources/PackagerVersion.txt'
echo " "
cat './Sys/Resources/GeckoVersion.txt'
echo " "
echo " "
echo "We will now update Packager, Update Gecko Codes, and Patch Slippi in that order."
echo " "
echo "If your local version of Packager does not match the one reported by the Master Server, please exit out once this first part is done."
echo " "
echo "You may stop the script at any time after each process if you do not want to perform the next step. You must run through all three steps your first time."
read -p "Press Enter to update Packager"
read -p "Press Enter again to confirm you read and understand the information above"
echo "We are now updating Packager..."
sleep 2
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/PackagerVersion.txt
mv PackagerVersion.txt Sys/Resources/
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Packager.sh
echo "Packager was updated. If your local version reported differently, please quit and restart the script to receive the latest fixes and updates."
read -p "Press Enter to update Gecko Codes"
echo "Updating Gecko Codes..."
sleep 1
wget http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/GKYE01.ini
wget http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/KHPE01.ini
wget http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/modifier_guide.txt
mv GKYE01.ini ./Sys/Gamesettings
mv KHPE01.ini ./Sys/Gamesettings
mv modifier_guide.txt ./Sys/Gamesettings
echo "We will now patch Slippi. If you have already done this, you can quit the script now."
read -p "Press Enter to patch Slippi"
wget https://raw.githubusercontent.com/EternallZM/Packager/main/Sys/Gamesettings/GYKJ01.ini
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Gamesettings/GYKP01.ini
mv GYKJ01.ini ./Sys/Gamesettings
mv GYKP01.ini ./Sys/Gamesettings
echo "We are done."
read -p "Press Enter to exit"
