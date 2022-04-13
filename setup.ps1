$ErrorActionPreference = "Stop"

# Switch network connection to private mode
# Required for WinRM firewall rules
$profile = Get-NetConnectionProfile
Set-NetConnectionProfile -Name $profile.Name -NetworkCategory Private

# WinRM Configure
winrm quickconfig -quiet
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
netsh advfirewall firewall add rule name="Windows Remote Managment (HTTP-In)" dir=in action=allow protocol=TCP localport=5985

# Reset auto logon count
# https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-shell-setup-autologon-logoncount#logoncount-known-issue
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name AutoLogonCount -Value 0

# Import Network Management Module
Import-Module -Name 'NetSecurity'

# Setup windows update service to manual
$wuauserv = Get-WmiObject Win32_Service -Filter "Name = 'wuauserv'"
$wuauserv_starttype = $wuauserv.StartMode
Set-Service wuauserv -StartupType Manual

# Install OenSSH
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Set service to automatic and start
Set-Service sshd -StartupType Automatic
Start-Service sshd

# Setup windows update service to original
Set-Service wuauserv -StartupType $wuauserv_starttype

# Configure PowerShell as the default shell
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "$Env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force

# Restart the service
Restart-Service sshd

# Configure SSH public key
$content = @"
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCeDZK1U+kKRC7mNwGgLydw6P8W6ZelX0B7+XTYWSvH4G0xNKtUYmxi6237JVddMzL8cdhm916xs02bjrTV5JAIzo4z4JQy3DK3g9dNEhODKMspe7PRbdXAXG8wcigl2t4xme78k3DIJ9KVPz5sVzg25FiY2gVGWSEeq1bsi1BDxIHJ1WFZvIeCRY3uEywq6IJT4cyuicTW611v9Q9CK/9rPzGz9uHVdpvQ7d
"@ 

# Write public key to file
$content | Set-Content -Path "$Env:ProgramData\ssh\administrators_authorized_keys"

# set acl on administrators_authorized_keys
$admins = ([System.Security.Principal.SecurityIdentifier]'S-1-5-32-544').Translate( [System.Security.Principal.NTAccount]).Value
$acl = Get-Acl $Env:ProgramData\ssh\administrators_authorized_keys
$acl.SetAccessRuleProtection($true, $false)
$administratorsRule = New-Object system.security.accesscontrol.filesystemaccessrule($admins,"FullControl","Allow")
$systemRule = New-Object system.security.accesscontrol.filesystemaccessrule("SYSTEM","FullControl","Allow")
$acl.SetAccessRule($administratorsRule)
$acl.SetAccessRule($systemRule)
$acl | Set-Acl

# Open firewall port 22
$FirewallParams = @{ 
  "DisplayName"       = 'OpenSSH SSH Server (sshd)' 
  "Direction"         = 'Inbound' 
  "Action"            = 'Allow' 
  "Protocol"          = 'TCP'
  "LocalPort"         = '22' 
  "Program"           = '%SystemRoot%\system32\OpenSSH\sshd.exe'
}
New-NetFirewallRule @FirewallParams

# Open firewall ICMP
$FirewallParams = @{ 
  "DisplayName"       = 'ICMP' 
  "Direction"         = 'Inbound' 
  "Action"            = 'Allow' 
  "Protocol"          = 'ICMP'
}
New-NetFirewallRule @FirewallParams