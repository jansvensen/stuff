Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -IncludeAllSubFeature

$password = Read-Host "Enter the SafeModeAdminPassword" -AsSecureString
Install-ADDSForest -DomainName jansvensen.de -DomainNetBiosName JANSVENSEN -DomainMode WinThreshold -ForestMode WinThreshold -SkipPreChecks -InstallDns:$true -SafeModeAdministratorPassword $password -Force