function set-dcv-redirections {
    param(
        [Parameter(Mandatory=$false)][string]$audioin, # Insert audio from the client to the NICE DCV server.
        [Parameter(Mandatory=$false)][string]$audioout, # Play back NICE DCV server audio on the client.
        [Parameter(Mandatory=$false)][string]$builtin, # All features.
        [Parameter(Mandatory=$false)][string]$clipboardcopy, # Copy data from the NICE DCV server to the client clipboard.
        [Parameter(Mandatory=$false)][string]$clipboardpaste, # Paste data from the client clipboard to the NICE DCV server.
        [Parameter(Mandatory=$false)][string]$display, # Receive visual data from the NICE DCV server.
        [Parameter(Mandatory=$false)][string]$filedownload, # Download files from the session storage.
        [Parameter(Mandatory=$false)][string]$fileupload, # Upload files to the session storage.
        [Parameter(Mandatory=$false)][string]$gamepad, # Use gamepads connected to a client computer in a session. Supported on version NICE DCV 2022.0 and later.
        [Parameter(Mandatory=$false)][string]$keyboard, # Input from the client keyboard to the NICE DCV server.
        [Parameter(Mandatory=$false)][string]$keyboardsas, # Use the secure attention sequence (CTRL+Alt+Del). Requires the keyboard feature. Supported on version NICE DCV 2017.3 and later.
        [Parameter(Mandatory=$false)][string]$mouse, # Input from the client pointer to the NICE DCV server.
        [Parameter(Mandatory=$false)][string]$pointer, # View NICE DCV server mouse position events and pointer shapes. Supported on version NICE DCV 2017.3 and later.
        [Parameter(Mandatory=$false)][string]$printer, # Create PDFs or XPS files from the NICE DCV server to the client.
        [Parameter(Mandatory=$false)][string]$screenshot, # When removing screenshot authorization, we recommended that you disable the clipboard-copy permission. This prevents users from capturing screenshots on the clipboard of the server and then pasting them on the client. When the screenshot authorization is denied, Windows and macOS will also prevent external tools from capturing a screenshot of the client. For example, using the Windows Snipping Tool on the NICE DCV client window will result in a black image. Save a screenshot of the remote desktop. It's supported on version NICE DCV 2021.2 and later.
        [Parameter(Mandatory=$false)][string]$smartcard, # Read the smart card from the client.
        [Parameter(Mandatory=$false)][string]$stylus, # Input from specialized USB devices, such as 3D pointing devices or graphic tablets.
        [Parameter(Mandatory=$false)][string]$touch, # Use native touch events. Supported on version DCV 2017.3 and later.
        [Parameter(Mandatory=$false)][string]$unsupervisedaccess, # Use to set owner-less access of users in a collaborative session.
        [Parameter(Mandatory=$false)][string]$usb, # Use USB devices from the client.
        [Parameter(Mandatory=$false)][string]$webcam # Use the webcam connected to a client computer in a session. Supported on version NICE DCV 2021.0 and later.
    )

    # Reset rights : &"C:\Program Files\NICE\DCV\Server\bin\dcv.exe" set-permissions --session console --reset-builtin
    # Set rights based on file: &"C:\Program Files\NICE\DCV\Server\bin\dcv.exe" set-permissions --session console --file "C:\ProgramData\deviceTRUST\DCV-Config\dcv-dt.perm"

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

set-dcv-redirections -audioin 0 -clipboardcopy 0 -clipboardpaste 0 -keyboardsas 0