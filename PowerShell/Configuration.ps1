# Configure 'Administrator' environment
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1 -Force
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "AlwaysShowMenus" -PropertyType DWord -Value 1 -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "NavPaneExpandToCurrentFolder" -PropertyType DWord -Value 1 -Force
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "HideDesktopIcons" -Force
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons" -Name "NewStartPanel" -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -PropertyType DWord -Value 0 -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -PropertyType DWord -Value 0 -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" -PropertyType DWord -Value 0 -Force
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets" -Name "Regedit" -Force
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit" -Name "Favorites" -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" -Name "Contexts" -PropertyType String -Value "Computer\HKEY_CURRENT_USER\Software\deviceTRUST\Contexts" -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" -Name "Properties" -PropertyType String -Value "Computer\HKEY_CURRENT_USER\Software\deviceTRUST\Properties" -Force

# Copy files and create folder(s)
Copy-Item -Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Registry Editor.lnk" -Destination "$env:SYSTEMDRIVE\Users\Public\Desktop" -Force

New-Item -ItemType directory -Name "Notepad++" -Path "$env:USERPROFILE\AppData\Roaming" -Force
Copy-Item -Path "$env:SYSTEMDRIVE\Transfer\$deviceTRUSTDemoBoxVersion\Content\Configuration\Notepad++\config.xml" -Destination "$env:USERPROFILE\AppData\Roaming\Notepad++" -Force