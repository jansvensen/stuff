$RepoPath = "C:\SharingTools\GIT\jansvensen\jansvensen"
$MasterFilePath = "C:\SharingTools\GIT\jansvensen\test\README.md"

$TempFilePath = "$RepoPath\main.yml"

Copy-Item -Path $MasterFilePath -Destination $TempFilePath

Get-ChildItem $RepoPath | Where-Object{$_.Name -like "*ansible*"} | Get-ChildItem -Recurse -Filter "readme.md" | ForEach-Object{

    #if($_.FullName -like "*\meta\*"){
    
        Remove-Item $_.FullName #-whatif
        Copy-Item $MasterFilePath $_.FullName #-whatif
    
   # }
}