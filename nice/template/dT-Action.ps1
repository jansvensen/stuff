function check-create-permfile {
    param(
        [Parameter(Mandatory=$true)][string]$PermFilePath
    )

    if( -not(Test-Path $PermFilePath)){
     
        $FileContent = "[permissions]`r`n;%any% references any user.`r`n;`r`n;Required basic rights`r`n%any% allow display`r`n%any% allow mouse`r`n%any% allow pointer`r`n%any% allow keyboard`r`n;`r`n; dT configurable rights"
        $FileContent | Out-File -FilePath $PermFilePath
        Start-Sleep -Seconds 3

    }

}

function set-dcv-redirections {
    param(
        [Parameter(Mandatory=$false)][string]$clipboardcopy, # Copy data from the NICE DCV server to the client clipboard.
        [Parameter(Mandatory=$false)][string]$clipboardpaste, # Paste data from the client clipboard to the NICE DCV server.
        [Parameter(Mandatory=$false)][string]$display, # Receive visual data from the NICE DCV server.
        [Parameter(Mandatory=$false)][string]$filedownload, # Download files from the session storage.
        [Parameter(Mandatory=$false)][string]$fileupload, # Upload files to the session storage.
        [Parameter(Mandatory=$false)][string]$printer, # Create PDFs or XPS files from the NICE DCV server to the client.
        [Parameter(Mandatory=$false)][string]$screenshot, # When removing screenshot authorization, we recommended that you disable the clipboard-copy permission. This prevents users from capturing screenshots on the clipboard of the server and then pasting them on the client. When the screenshot authorization is denied, Windows and macOS will also prevent external tools from capturing a screenshot of the client. For example, using the Windows Snipping Tool on the NICE DCV client window will result in a black image. Save a screenshot of the remote desktop. It's supported on version NICE DCV 2021.2 and later.
        [Parameter(Mandatory=$false)][string]$usb, # Use USB devices from the client.
        [Parameter(Mandatory=$false)][string]$webcam, # Use the webcam connected to a client computer in a session. Supported on version NICE DCV 2021.0 and later.
        [Parameter(Mandatory=$true)][string]$PermFilePath
    )

    $RightsFileIn = Get-Content $PermFilePath

    $ParameterList = (Get-Command -Name $MyInvocation.InvocationName).Parameters;
    foreach ($key in $ParameterList.keys){
        $var = Get-Variable -Name $key -ErrorAction SilentlyContinue
        if($var.value -ne "" -AND $var.name -ne "PermFilePath"){
            $var | ForEach-Object{

            $Found = $False

                $var

                switch($var.value){
                    "0"{$rights = "deny"}
                    "1"{$rights = "allow"}
                }

                switch($var.name){
                    "clipboardcopy"{$Property = "clipboard-copy"}
                    "clipboardpaste"{$Property = "clipboard-paste"}
                    default{$Property = $var.name}
                }

                $NewLine = "%any% $rights $Property"
                write-output "Newline: $NewLine"

                $RightsFileIn | ForEach-Object { 
                    if ($_ -match $Property){
            
                        $OldLine = $_
                        write-output "OldLine: $OldLine"
                        $Found = $true
                        (Get-Content $PermFilePath).replace($OldLine, $NewLine) | Set-Content $PermFilePath
        
                    }
                }

                if($Found -ne $True){
                    Add-Content -Path $PermFilePath $NewLine  
                }

            } 
        }
    }
}

$PermFilePath = "C:\ProgramData\deviceTRUST\DCV-Config\dt-dcv-permissions.perm"

check-create-permfile -PermFilePath $PermFilePath
set-dcv-redirections -clipboardcopy 0 -clipboardpaste 0 -PermFilePath $PermFilePath
&"C:\Program Files\NICE\DCV\Server\bin\dcv.exe" set-permissions --session console --file $PermFilePath