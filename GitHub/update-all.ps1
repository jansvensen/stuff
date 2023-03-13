Get-ChildItem C:\SharingTools\GIT\deviceTRUST-iac-resources | Where-Object{$_.Name -like "*adc*"} | ForEach-Object{

    cd $_.FullName
    git add *
    git commit --all -m "."
    # git push

}