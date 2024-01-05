Get-ChildItem C:\Sync-Tools\GIT\jansvensen | ForEach-Object{

    cd $_.FullName
    # git add *
    git commit --all -m "."
    # git push

}