Get-ChildItem C:\Sync-Tools\GIT\jansvensen | Where-Object{$_.Name -like "*ansible*"} | ForEach-Object{

    cd $_.FullName
    # git add *
    git commit --all -m "."
    # git push

}