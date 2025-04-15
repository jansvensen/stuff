$users =  get-aduser -filter {(enabled -eq $true)} -properties  UserPrincipalName,samaccountname,mail  | select UserPrincipalName, samaccountname, emailAddress

foreach($user in $users){
$user

 get-aduser  $user.samaccountname | Set-ADuser -emailAddress $user.UserPrincipalName

}