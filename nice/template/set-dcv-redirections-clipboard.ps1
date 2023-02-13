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
        [Parameter(Mandatory=$false)][string]$webcam # Use the webcam connected to a client computer in a session. Supported on version NICE DCV 2021.0 and later.
    )

    $RightsFileInPath = "C:\ProgramData\deviceTRUST\DCV-Config\dcv-dt.perm"
    $RightsFileIn = Get-Content $RightsFileInPath

    $ParameterList = (Get-Command -Name $MyInvocation.InvocationName).Parameters;
    foreach ($key in $ParameterList.keys){
        $var = Get-Variable -Name $key -ErrorAction SilentlyContinue
        if($var.value -ne ""){
            $var | ForEach-Object{

            $Found = $False

                $var

                switch($var.value){
                    "0"{$rights = "disallow"}
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
                        (Get-Content $RightsFileInPath).replace($OldLine, $NewLine) | Set-Content $RightsFileInPath
        
                    }
                }

                if($Found -ne $True){
                    Add-Content -Path $RightsFileInPath $NewLine  
                }

            } 
        }
    }
}

set-dcv-redirections -clipboardcopy 0 -clipboardpaste 0