# Packager
A Packager for Air Ride Online.

> What is Packager?

Packager at its core is a zip file including a script (for each operating system) and a resource folder. 
The resource folder provides necessary contents to each script in a different way. All scripts will:

- Patch mainline Dolphin for the latest Air Ride.
- Check for updates automatically (but not update automatically).
- Provide the latest Gecko codes to the Dolphin profile.

## Windows

1. Download Packager content
2. Run Dolphin.exe once so that it may generate necessary folders.
3. Set your game file paths, and other settings as needed.
4. Right click ```Packager.ps1```, run with Powershell, then have it Patch Dolphin.
   - For those using OneDrive folder redirection, use ```Packager_OneDrive.ps1``` instead.
5. You should receive a successful patch message when the process completes, with no errors in the console.

> If you are getting a Powershell error regarding script execution policy, you will need to configure PS to allow remote signed scripts. 
Do so by executing the following in an elevated Powershell session:

```Set-ExecutionPolicy RemoteSigned``` or ```Set-ExecutionPolicy Unrestricted```

> Once complete, you should return your system back to a restricted execution policy.

## MacOS

1. Download Packager content
2. Run Dolphin.exe once so that it may generate necessary folders.
3. Set your game file paths, and other settings as needed.
4. Open a Terminal session and change directory to where you have Packager
5. Run ```chmod a+x Packager_OSX.sh```
6. Run ```./Packager_OSX.sh```
7. Script will begin running and patch Dolphin with codes and other data.

## Linux

> It is assumed you know how to compile your own builds, compatible with the other NetPlay dolphin versions. Due to complications and massive variations in distributions,
> we do not provide pre-compiled builds or any support regarding this. Since it is mainline Dolphin, you can view their docs 1:1 and receive support from them if necessary.

### Do not bother Dolphin developers regarding anything related to Packager.

1. Download Packager content
2. Run Dolphin.exe once so that it may generate necessary folders.
3. Set your game file paths, and other settings as needed.
4. Open a Terminal session and change directory to where you have Packager
5. Run ```chmod a+x Packager_GNU.sh```
6. Run ```./Packager_GNU.sh```
7. Script will begin running and patch Dolphin with codes and other data.
