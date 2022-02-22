#!/bin/bash
echo "Welcome to the Kirby Air Ride Packager"
echo "Created by Eternalll#6100 for the Kirby Workshop Community"
echo "https://kirbyairri.de"
echo " " 
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/PackagerVersion_GNU.txt
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/GeckoVersion.txt
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/NetplayVersion.txt
echo " "
echo " - - - - - IMPORTANT PLEASE READ - - - - -"
echo " "
echo "The Master Server reports the following versions as the latest:"
echo " "
cat 'NetplayVersion.txt'
echo " "
cat 'PackagerVersion_GNU.txt'
echo " "
cat 'GeckoVersion.txt'
echo " "
echo " "
rm 'NetplayVersion.txt'
rm 'PackagerVersion_GNU.txt'
rm 'GeckoVersion.txt'
echo "The current versions of your Packager are:"
echo " "
cat './Sys/Resources/PackagerVersion_GNU.txt'
echo " "
cat './Sys/Resources/GeckoVersion.txt'
echo " "
echo " "
echo "We will now update Packager and Patch Dolphin."
echo " "
echo "If your NetPlay version does not match the Dolphin version you downloaded, please download the correct version before continuing."
echo " "
echo "If your local version of Packager does not match the one reported by the Master Server, please exit out once this first part is done."
echo " "
echo "You may stop the script at any time after each process if you do not want to perform the next step. You must run through all three steps your first time."
read -p "Press Enter to update Packager"
read -p "Press Enter again to confirm you read and understand the information above"
echo "We are now updating Packager..."
sleep 2
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/PackagerVersion_GNU.txt
mv PackagerVersion_GNU.txt './Sys/Resources/'
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Packager_GNU.sh
mv -f Packager_GNU.sh.1 Packager_GNU.sh
echo "Packager was updated. If your local version reported differently, please quit and restart the script to receive the latest fixes and updates."
read -p "Press Enter to update Gecko Codes"
echo "Updating Gecko Codes..."
sleep 1
wget http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/GKYE01.ini
wget http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/KHPE01.ini
wget http://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/modifier_guide.txt
wget http://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/GeckoVersion.txt
mv GeckoVersion.txt "./Sys/Resources/"
mv GKYE01.ini "/home/$USER/.local/share/dolphin-emu/GameSettings/"
mv KHPE01.ini "/home/$USER/.local/share/dolphin-emu/GameSettings/"
mv modifier_guide.txt "/home/$USER/.local/share/dolphin-emu/GameSettings/"
read -p "Press Enter to patch Dolphin. Your settings will be reset as this should only be run on your first setup."
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Config/Dolphin.ini
wget https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Config/GFX.ini
mv Dolphin.ini "/home/$USER/.config/dolphin-emu"
mv GFX.ini "/home/$USER/.config/dolphin-emu"
echo "We are done."
read -p "Press Enter to exit"