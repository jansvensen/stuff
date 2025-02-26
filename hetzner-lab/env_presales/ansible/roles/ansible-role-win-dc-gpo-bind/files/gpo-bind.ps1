$target = $env:target
$gpos = $env:gpos
$domain = $env:domain

$gpos.Split(",") | ForEach-Object {
    $found = $false
    $gponame = $_

    (Get-GPInheritance -Target $target).GpoLinks.DisplayName | ForEach-Object{
        if($_ -eq $gponame){$found = $true}    
    }    
    if($found -eq $false){New-GPLink -Name $gponame -Domain $domain -Target $target -LinkEnabled Yes}
}