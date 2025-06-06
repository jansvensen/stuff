# OUs
$computername = Invoke-Expression -Command 'hostname'
$domainname = 'dom' + $computername.replace('vm','')
$DN = 'DC=' + $domainname + ',DC=sj,DC=az'
$Path = $DN
New-ADOrganizationalUnit -Name "Objects" -Path $path
$Path = "OU=Objects," + $DN
New-ADOrganizationalUnit -Name "Accounts" -Path $path
$Path = "OU=Accounts,OU=Objects," + $DN
New-ADOrganizationalUnit -Name "User" -Path $path
New-ADOrganizationalUnit -Name "Admins" -Path $path
New-ADOrganizationalUnit -Name "Services" -Path $path
New-ADOrganizationalUnit -Name "Computer" -Path $path

# Users
$usercount = 50 # number of  users to create

$password = (Read-Host -AsSecureString 'AccountPassword')

1 .. $usercount | ForEach-Object {
    $user = $_.ToString("000000")
    $name = "Test_" + $domainname + "_" + $user

    $Attributes = @{
        Name = $name
        AccountPassword = $password
        Enabled = $true
        DisplayName = $name
        GivenName = "Test_" + $domainname
        Surname = $user
        UserPrincipalName = "test_" + $domainname + "_" + $user + "@sj.az"
        Path = "OU=User,OU=Accounts,OU=Objects," + $DN
    }

    New-ADUser @Attributes
    
}