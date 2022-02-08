# Console Info
Write-Output `a"Welcome to the Kirby Air Ride Online: Packager"
Write-Output `a"Created by Eternalll#6100 on Discord for the Kirby Workshop Community"
Write-Output `a"https://kirbyairri.de"
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "Green"
Get-Content -Path ".\Sys\Resources\PackagerVersion.txt"
Get-Content -Path ".\Sys\Resources\GeckoVersion.txt"
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "Yellow"
Write-Output `a"To check for updates, select 'Check for Updates' and compare with the versions above (your current versions)."
Write-Output `a"If versions match, you do not need to Update Packager at all."
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "Red"
Write-Output `a"Ensure you have read the guide before running any commands."
Write-Output `a"The guide is very specific about where you place this program in files."
$host.UI.RawUI.ForegroundColor = "White"

# Build GUI

Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName PresentationCore,PresentationFramework
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Kirby Air Ride Packager'
$main_form.Width = 400
$main_form.Height = 400
$main_form.AutoSize = $true

$main_form.MinimizeBox = $False
$main_form.MaximizeBox = $False
$main_form.ShowInTaskbar = $False
$main_form.StartPosition = "CenterScreen"

$Font = New-Object System.Drawing.Font("Arial",12,[System.Drawing.FontStyle]::Bold)
$main_form.Font = $Font

$Image = [system.drawing.image]::FromFile(".\Sys\Resources\background.png")
$main_form.BackgroundImage = $Image
$main_form.BackgroundImageLayout = "None"
$main_form.Width = $Image.Width
$main_form.Height = $Image.Height

$Icon = New-Object system.drawing.icon (".\Sys\Resources\karonline.ico")
$main_form.Icon = $Icon

# Patch Slippi

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,40)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#D9534F"
$Button.Text = "Patch Slippi"
$main_form.Controls.Add($Button)
#Button Click
$Button.Add_Click(

{

$host.UI.RawUI.ForegroundColor = "Red"
Write-Output `a"We are now patching Slippi."
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Gamesettings/GKYE01.ini' -OutFile "GKYE01.ini"
move-Item "GKYE01.ini" -Destination ".\Sys\Gamesettings" -force
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Gamesettings/GYKJ01.ini' -OutFile "GYKJ01.ini"
move-Item "GYKJ01.ini" -Destination ".\Sys\Gamesettings" -force
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Gamesettings/GYKP01.ini' -OutFile "GYKP01.ini"
move-Item "GYKP01.ini" -Destination ".\Sys\Gamesettings" -force
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Gamesettings/KHPE01.ini' -OutFile "KHPE01.ini"
move-Item "KHPE01.ini" -Destination ".\Sys\Gamesettings" -force
Set-Location -Path "User\GameSettings\"
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/GKYE01.ini' -OutFile 'GKYE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/KHPE01.ini' -OutFile 'KHPE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/modifier_guide.txt' -OutFile 'modifier_guide.txt'
[System.Windows.MessageBox]::Show('Kirby Air Ride can now be played online.','Patch Success')
stop-process -Id $PID

}

)# Packager Update

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,80)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#428BCA"
$Button.Text = "Packager Update"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

[System.Windows.MessageBox]::Show('Attempting to update Packager content.','Packager Update Notice')
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Packager.ps1' -OutFile 'Packager.ps1'
[System.Windows.MessageBox]::Show('Packager has been updated.','Update Success')
stop-process -Id $PID

}
) # Check for Updates

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,120)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.Text = "Check for Updates"
$Button.BackColor = "#428BCA"
$main_form.Controls.Add($Button)
$Button.Add_Click(
{

Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/Sys/Resources/CFU.bat' -OutFile 'CFU.bat'
move-Item "CFU.bat" -Destination ".\Sys\Resources\" -force
$A = Start-Process -FilePath '.\Sys\Resources\CFU.bat' -Wait -passthru;$a.ExitCode
Remove-Item ".\Sys\Resources\CFU.bat" -force

}
) # Gecko Restore Process

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,160)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#5CB85B"
$Button.Text = "Restore Gecko Codes"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

    [System.Windows.MessageBox]::Show('Select your directory to restore codes from. This directory must contain .ini files ONLY.','Gecko Code Restore')
$shell = New-Object -ComObject Shell.Application
$selectedfolder = $shell.BrowseForFolder( 0, 'Select Directory Containing Backup', 16, $shell.NameSpace( 17 ).Self.Path ).Self.Path
copy-Item "$selectedfolder\GKYE01.ini" -Destination ".\User\GameSettings"
copy-Item "$selectedfolder\KHPE01.ini" -Destination ".\User\GameSettings"
[System.Windows.MessageBox]::Show('Gecko Codes Restored.','Gecko Code Restore')
stop-process -Id $PID

}

) # Gecko Backup and Update Process

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,200)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.Text = "Backup and Update Gecko"
$Button.BackColor = "#5CB85B"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

[System.Windows.MessageBox]::Show('You will be asked to back up your codes first. If you do not wish to do so, select Cancel when it asks for the path.','Gecko Backup and Update Notice')
$shell = New-Object -ComObject Shell.Application
$selectedfolder = $shell.BrowseForFolder( 0, 'Select Where To Save Backup', 16, $shell.NameSpace( 17 ).Self.Path ).Self.Path
Set-Location -Path User\Gamesettings
copy-Item "GKYE01.ini" -Destination $selectedfolder
copy-Item "KHPE01.ini" -Destination $selectedfolder
[System.Windows.MessageBox]::Show('Press OK to update Gecko Codes and exit Packager.','Gecko Backup and Update Notice')
Set-Location -Path "User\GameSettings\"
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/GKYE01.ini' -OutFile 'GKYE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/KHPE01.ini' -OutFile 'KHPE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/EternalllZM/Packager/main/User/Gamesettings/modifier_guide.txt' -OutFile 'modifier_guide.txt'
[System.Windows.MessageBox]::Show('Gecko Codes Updated.','Gecko Codes Update')
stop-process -Id $PID

}
) # Get Help

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,240)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.Text = "Get Help"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

Start-Process -FilePath https://www.kirbyairri.de/winpackager.html

}

) # Exit Packager

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,280)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#D9534F"
$Button.Text = "Close"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

stop-process -Id $PID

}

)

$main_form.ShowDialog()