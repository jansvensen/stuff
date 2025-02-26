Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -IncludeAllSubFeature

$password = Read-Host "Enter the SafeModeAdminPassword" -AsSecureString
Install-ADDSForest -DomainName sjansen.local -DomainNetBiosName SJANSEN -DomainMode WinThreshold -ForestMode WinThreshold -SkipPreChecks -InstallDns:$true -SafeModeAdministratorPassword $password -Force