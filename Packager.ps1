# Console Info Display (Packager v1.5+)
Write-Output `a"Welcome to the Kirby Air Ride Online: Packager"
Write-Output `a"Created by Eternalll#6100 on Discord for the Kirby Workshop Community"
Write-Output `a"https://kirbyairri.de"
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "Green"
Write-Output `a"Packager Version:  v1.6"
Write-Output `a"Gecko Codebase:    v2.0u3"
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "Yellow"
Write-Output `a"To check for updates, select 'Check for Updates' and compare with the versions above (your current versions)."
Write-Output `a"If versions match, you do not need to Update Packager at all."
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "Red"
Write-Output `a"Ensure you have read the guide before running any commands."
Write-Output `a"The guide is very specific about where you place files including this program."
Invoke-WebRequest -Uri "https://github.com/EternalllZM/Packager/blob/main/Sys/Resources/Packager/background.png" -OutFile 'background.png'
move-Item "citytrial.png" -Destination ".\Sys\Resources\Packager" -force
Invoke-WebRequest -Uri "https://github.com/EternalllZM/Packager/blob/main/Sys/Resources/Packager/karonline.ico" -OutFile 'karonline.ico'
move-Item "karonline.ico" -Destination ".\Sys\Resources\Packager" -force

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

$Image = [system.drawing.image]::FromFile(".\Sys\Resources\Packager\background.png")
$main_form.BackgroundImage = $Image
$main_form.BackgroundImageLayout = "None"
$main_form.Width = $Image.Width
$main_form.Height = $Image.Height

$Icon = New-Object system.drawing.icon (".\Sys\Resources\Packager\karonline.ico")
$main_form.Icon = $Icon

# Packager Update

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,40)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#428BCA"
$Button.Text = "Update Packager"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

[System.Windows.MessageBox]::Show('Attempting to update Packager content. Make sure to check whether you need updates by selecting Check for Updates on next run.','Packager Update Notice')
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sp00nd/AirRideOnline/main/Kirby%20Air%20Ride%20Online%20Support/Generate%20Build%20Information.cmd' -OutFile 'Generate Build Information.cmd'
move-Item "Generate Build Information.cmd" -Destination ".\Kirby Air Ride Online Support" -force
Start-Sleep -Seconds 2
[System.Windows.MessageBox]::Show('Press OK to be redirected to Packager download.','Packager Update Notice')
Start-Process -FilePath https://www.kirbyairri.de/winpackager.html

}
)

# Check for Updates

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,80)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.Text = "Check for Updates"
$Button.BackColor = "#428BCA"
$main_form.Controls.Add($Button)
#Button2 Click
$Button.Add_Click(
{

Start-Sleep -Seconds 1
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sp00nd/AirRideOnline/main/Kirby%20Air%20Ride%20Online%20Support/Update%20Check.cmd' -OutFile 'Update Check.cmd'
move-Item "Update Check.cmd" -Destination ".\Kirby Air Ride Online Support" -force
$A = Start-Process -FilePath '.\Kirby Air Ride Online Support\Update Check.cmd' -Wait -passthru;$a.ExitCode
Start-Sleep -Seconds 2
Remove-Item ".\Kirby Air Ride Online Support\Update Check.cmd" -force
Start-Sleep -Seconds 1

}
)
# Gecko Restore Process
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,160)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#5CB85B"
$Button.Text = "Restore Gecko Codes"
$main_form.Controls.Add($Button)
#Button2 Click
$Button.Add_Click(

{

    [System.Windows.MessageBox]::Show('Select your directory to restore codes from. This directory must contain .ini files ONLY.','Gecko Code Restore')
$shell = New-Object -ComObject Shell.Application
$selectedfolder = $shell.BrowseForFolder( 0, 'Select Directory Containing Backup', 16, $shell.NameSpace( 17 ).Self.Path ).Self.Path
copy-Item "$selectedfolder\GKYE01.ini" -Destination ".\User\GameSettings"
copy-Item "$selectedfolder\KHPE01.ini" -Destination ".\User\GameSettings"
[System.Windows.MessageBox]::Show('Gecko Codes Restored. Press OK to close out of Packager.','Gecko Code Restore')
Start-Sleep -Seconds 3
stop-process -Id $PID

}

)
# Gecko Backup and Update Process
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,120)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.Text = "Backup and Update Gecko"
$Button.BackColor = "#5CB85B"
$main_form.Controls.Add($Button)
#Button2 Click
$Button.Add_Click(

{

[System.Windows.MessageBox]::Show('You will be asked to back up your codes first. If you do not wish to do so, select Cancel when it asks for the path.','Gecko Backup and Update Notice')
$shell = New-Object -ComObject Shell.Application
$selectedfolder = $shell.BrowseForFolder( 0, 'Select Where To Save Backup', 16, $shell.NameSpace( 17 ).Self.Path ).Self.Path
Set-Location -Path User\Gamesettings
copy-Item "GKYE01.ini" -Destination $selectedfolder
copy-Item "KHPE01.ini" -Destination $selectedfolder
Start-Sleep -Seconds 3
[System.Windows.MessageBox]::Show('Press OK to update Gecko Codes and exit Packager.','Gecko Backup and Update Notice')
Set-Location -Path User\GameSettings\
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sp00nd/AirRideOnline/main/User/Gamesettings/GKYE01.ini' -OutFile 'GKYE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sp00nd/AirRideOnline/main/User/Gamesettings/KHPE01.ini' -OutFile 'KHPE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sp00nd/AirRideOnline/main/User/Gamesettings/modifier_guide.txt' -OutFile 'modifier_guide.txt'
Start-Sleep -Seconds 3
stop-process -Id $PID

}
)
# Generate Support Bundle
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,200)
$Button.Size = New-Object System.Drawing.Size(250,30)
#$Button.BackColor = "#A1A1A1"
$Button.Text = "Generate Support Bundle"
$main_form.Controls.Add($Button)
#Button Click
$Button.Add_Click(

{

$Label3.ForeColor = "#FFFFBA"
$Label3.Text =  "Generating Support Bundle..."
$A = Start-Process -FilePath '.\Kirby Air Ride Online Support\Generate Build Information.cmd' -Wait -passthru;$a.ExitCode
Start-Sleep -Seconds 2
[System.Windows.MessageBox]::Show('Support Bundle Generated.','Success.')

}

)
#############SUPPORT DOC PROCESS#############
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,240)
$Button.Size = New-Object System.Drawing.Size(250,30)
#$Button.BackColor = "#A1A1A1"
$Button.Text = "Packager Help"
$main_form.Controls.Add($Button)
#Button Click
$Button.Add_Click(

{

Start-Process -FilePath https://www.kirbyairri.de/winpackager.html

}

)
# Exit Packager
$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,280)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#D9534F"
$Button.Text = "Close"
$main_form.Controls.Add($Button)
#Button Click
$Button.Add_Click(

{

stop-process -Id $PID

}

)

#END OF THE SCRIPT, DO NOT MOVE
$main_form.ShowDialog()