<# Export #>
$SourcePath = "c:\_GPO"
mkdir $SourcePath

Get-GPO -all | ForEach-Object{
    $GPOName = $_.DisplayName
    $GPOID = $_.ID
    $BackupPath = $SourcePath+ "\" + $GPOName
    mkdir $BackupPath
    Backup-GPO -Path $BackupPath -Guid $GPOID #-WhatIf
} 

break
<# Import #>
$SourcePath = "c:\_GPO"

Get-Childitem $BackupPath | ForEach-Object{

    $BackupGUID = (Get-ChildItem $_.FullName).Name

    Import-GPO -BackupId $BackupGUID -Path $_.FullName -TargetName $_.Name -CreateIfNeeded #-WhatIf

}