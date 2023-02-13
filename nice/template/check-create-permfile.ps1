function check-create-permfile {
    param(
        [Parameter(Mandatory=$true)][string]$PermFilePath
    )

    if( -not(Test-Path $PermFilePath)){
     
        $FileContent = "[permissions]`r`n;%any% references any user.`r`n;`r`n;Required basic rights`r`n%any% allow display`r`n%any% allow mouse`r`n%any% allow pointer`r`n%any% allow keyboard`r`n;`r`n; dT configurable rights"
        $FileContent | Out-File -FilePath $PermFilePath

    }

}

check-create-permfile -PermFilePath "C:\Users\SvenJansen.AzureAD\Desktop\test.txt"