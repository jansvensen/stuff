# For an unknown reason, Importing without this fails with "access denied"
write-output "#####################################################################"
whoami
write-output "#####################################################################"

$BackupPath = "c:\gpo\GPO"

Get-Childitem $BackupPath | ForEach-Object{

    $BackupGUID = (Get-ChildItem $_.FullName).Name.split(" ")[0].Replace("{","").Replace("}","")

    Import-GPO -BackupId $BackupGUID -Path $_.FullName -TargetName $_.Name -CreateIfNeeded

}