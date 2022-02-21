# Packager
A Packager for Air Ride Online.

> What is Packager?

Packager at its core is a zip file including a script (for each operating system) and a resource folder. 
The resource folder provides necessary contents to each script in a different way. All scripts will:

- Patch mainline Dolphin for the latest Air Ride.
- Check for updates automatically (but not update automatically).
- Provide the latest Gecko codes to the Dolphin profile.

## Windows

1. Download Packager content and copy contents into the ```root``` of your Dolphin folder (where the executable is located).
2. Run Dolphin.exe once so that it may generate necessary folders.
3. Set your game file paths, and other settings as needed.
4. Right click ```Packager.ps1```, run with Powershell, then have it Patch Dolphin.
5. You should receive a successful patch message when the process completes, with no errors in the console.

> If you are getting a Powershell error regarding script execution policy, you will need to configure PS to allow remote signed scripts. 
Do so by executing the following in an elevated Powershell session:

```Set-ExecutionPolicy RemoteSigned``` or ```Set-ExecutionPolicy Unrestricted```

> Once complete, you should return your system back to a restricted execution policy.

## MacOS

1. Download Packager content
2. Open a Terminal session and change directory to where you have Packager
3. Run ```chmod a+x ./Packager_OSX.sh```
4. Run ```./Packager_OSX.sh```
5. Script will begin running and patch Dolphin with codes and other data.

## Linux

> This script is not ready yet, but being actively developed.
