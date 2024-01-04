<# Export #>

# Set the source path for exporting GPOs
$SourcePath = "c:\_GPO"
mkdir $SourcePath

# Loop through all GPOs and export each one to a separate directory
Get-GPO -all | ForEach-Object {
    $GPOName = $_.DisplayName
    $GPOID = $_.ID
    $BackupPath = $SourcePath + "\" + $GPOName
    mkdir $BackupPath
    Backup-GPO -Path $BackupPath -Guid $GPOID #-WhatIf
}


<# Import #>

# Set the source path for importing GPOs
$SourcePath = "c:\_GPO"

# Loop through all directories in the source path (each containing a GPO backup)
Get-Childitem $BackupPath | ForEach-Object {
    # Retrieve the GUID of the GPO backup
    $BackupGUID = (Get-ChildItem $_.FullName).Name

    # Import the GPO from the backup
    Import-GPO -BackupId $BackupGUID -Path $_.FullName -TargetName $_.Name -CreateIfNeeded #-WhatIf
}
