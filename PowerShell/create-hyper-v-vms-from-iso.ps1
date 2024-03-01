$InputFolder = 'C:\Users\SvenJansen\Desktop\Igel'
$Versions = (Get-ChildItem $InputFolder).BaseName.Trim("osc")

Remove-Item c:\igel -Recurse -Force

if(!(Test-Path c:\igel)){New-Item -ItemType Directory c:\igel}
$versions | ForEach-Object{
    $ComputerName = 'igel-' + $_
    
    if(!(Test-Path c:\igel\$_)){New-Item -ItemType Directory c:\igel\$_}
    Remove-VM -Name $ComputerName -Force
    New-VM -Name $ComputerName -MemoryStartupBytes 4GB -NewVHDPath c:\igel\$_\igel-$_.vhdx -BootDevice CD -NewVHDSizeBytes 30Gb -SwitchName "Default Switch"
    Add-VMDvdDrive -VMName $ComputerName -Path "C:\Users\SvenJansen\Desktop\Igel\osc$_.iso"
    Start-VM $ComputerName
}