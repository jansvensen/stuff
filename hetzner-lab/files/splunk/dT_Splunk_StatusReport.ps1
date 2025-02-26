
"IGEL","macOS","Windows","No Client" | ForEach-Object{

    $Counter = 1

    do {

        $Category = $_
    
        $DeviceTrustClient = "Available"
    
        # Session Date
        $SessionDate = Get-Date ((((Get-Date).AddMonths(-(Get-Random -Minimum 0 -Maximum 13)).AddDays(-(Get-Random -Minimum 0 -Maximum 29)).AddHours(-(Get-Random -Minimum 0 -Maximum 25))).AddMinutes(-(Get-Random -Minimum 0 -Maximum 61))).AddSeconds(-(Get-Random -Minimum 0 -Maximum 61)))
    
        # Generate a random device name
        $DeviceSuffix = (Get-Random –Minimum 1 –Maximum 10000).ToString("00000")
        $DeviceName = ("DTLDTW", "ITC", "DE-DT", "UK-DT", "US-DT", "TCDT" | Get-Random) + $DeviceSuffix
     
        # Access Mode
        $AccessMode = "External","Internal" | Get-Random
    
        # Country
        $Country = "CA","CN","DE","NL","RU","UK","US","Unknown" | Get-Random
    
        # Country Provider
        if ($Country -ne "Unknown") {$CountryProvider = "Whois","ThirdParty WiFi" | Get-Random} else {$CountryProvider = "Unknown"}
    
        # Hardware BIOS Release Date
        $HardwareBiosReleaseDate = ((((Get-Date -Date $SessionDate).AddMonths(-(Get-Random -Minimum 1 -Maximum 19)).AddHours(-(Get-Random -Minimum 1 -Maximum 25))).AddMinutes(-(Get-Random -Minimum 1 -Maximum 61))).AddSeconds(-(Get-Random -Minimum 1 -Maximum 61))).ToString("yyyy-MM-ddTHH:mm:ss.000Z")
    
        # Hardware Secure Boot
        $HardwareSecureBoot = "true","false" | Get-Random   
    
        # Economic Region
        switch ($Country) {
            "DE" {$EconomicRegion = "EMEA"}
            "NL" {$EconomicRegion = "EMEA"}
            "UK" {$EconomicRegion = "EMEA"}
            "US" {$EconomicRegion = "AMER"}
            "CA" {$EconomicRegion = "AMER"}
            "CN" {$EconomicRegion = "APAC"}
            "RU" {$EconomicRegion = "APAC"}
            "Unknown" {$EconomicRegion = "Unknown"}
        }
    
        # Network Address Assignment
        $NetworkAddressAssignment = "DHCP","Static" | Get-Random
    
        # Network IP Address
        $NetworkIPAddress = ("10.100.123.","10.199.12.","17.123.77.","192.168.0.","192.168.122.","192.168.17." | Get-Random) + (Get-Random –Minimum 10 –Maximum 255)
        
        # Network Mac Address
        $NetworkMacAddress = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()
        
        # Network Configuration
        switch ($NetworkIPAddress) {
            "192.168.0.*" {
                $NetworkSubnet = "192.168.0.0/24"
                $NetworkGateway = "192.168.0.1"
                $NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()
                $NetworkDHCPServer = "192.168.0.1"
                $NetworkDNSServer = "192.168.0.1"
                $NetworkDNSSuffix = "fritz.box"
            }
            "192.168.17.*" {
                $NetworkSubnet = "192.168.17.0/24"
                $NetworkGateway = "192.168.17.253"
                $NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()
                $NetworkDHCPServer = "192.168.17.253"
                $NetworkDNSServer = "192.168.17.253"
                $NetworkDNSSuffix = "myhome.local"
            }
            "192.168.122.*" {
                $NetworkSubnet = "192.168.122.0/23"
                $NetworkGateway = "192.168.122.1"
                $NetworkGatewayMac = ((0..5 | ForEach-Object { '{0:x}{1:x}' -f (Get-Random -Minimum 0 -Maximum 15),(Get-Random -Minimum 0 -Maximum 15)})  -join ':').ToUpper()
                $NetworkDHCPServer = "192.168.122.1"
                $NetworkDNSServer = "192.168.122.1"
                $NetworkDNSSuffix = "corporate.net"
            }
            "10.100.123.*" {
                $NetworkSubnet = "10.100.123.0/20"
                $NetworkGateway = "10.100.123.244"
                $NetworkGatewayMac = "0A-51-52-E2-49-41"
                $NetworkDHCPServer = "10.100.123.254"
                $NetworkDNSServer = "10.100.123.253"
                $NetworkDNSSuffix = "de.corporate.local"
            }
            "10.199.12.*" {
                $NetworkSubnet = "10.199.12.0/23"
                $NetworkGateway = "10.199.12.114"
                $NetworkGatewayMac = "0B-67-34-E1-8B-22"
                $NetworkDHCPServer = "10.199.12.111"
                $NetworkDNSServer = "10.199.12.110"
                $NetworkDNSSuffix = "uk.corporate.local"
            }
            "17.123.77.*" {
                $NetworkSubnet = "17.123.77.0/21"
                $NetworkGateway = "17.123.77.1"
                $NetworkGatewayMac = "0C-78-21-F0-A9-10"
                $NetworkDHCPServer = "17.123.77.2"
                $NetworkDNSServer = "17.123.77.3"
                $NetworkDNSSuffix = "us.corporate.local"
            }
        }

        # OS Name
        $OSName = $_
    
        # Region Keyboard Locale
        $RegionKeyboardLocale = "de-DE","en-CA","en-UK","en-US","nl-NL","ru-RU","zh-CN" | Get-Random
    
        # Region Locale
        $RegionLocale =  $RegionKeyboardLocale
    
        # Region Timezone Offset
        $RegionTimezoneOffset = "-480","-360","-240","-120","-60","0","60","120","240","360" | Get-Random
        
        # Remote Controlled
        $RemoteControlled = "True","False" | Get-Random
        
        # Remoting Client Protocol
        $RemoteClientProtocol = "WSP","Blast","ICA","PCoIP","RDP" | Get-Random
        
        # Remoting Client Version
        if ($RemoteClientProtocol -eq "ICA" -or $RemoteClientProtocol -eq "Blast") {$RemoteClientVersion = "16.9.01.01","17.06.01.01","18.3.07.10","19.3.0.5","20.1.23.21","20.1.23.21","20.1.45.11","20.12.0.12","20.9.0.3","21.02.0.25" | Get-Random} else {$RemoteClientVersion = "Unavailable"}
        
        # Session User Domain
        $SessionUserDomain = "CORPORATE","company.local","uk.corporate.local","us.corporate.local","de.corporate.local","UK.local","US.local","DE.local","Germany","GLOBAL" | Get-Random
    
        # Session User Name
        $SessionUserName = ("UsEA","IDBE","DEBB","UKDA","USWC","UID2","PUID","GLUK","DEV","Test" | Get-Random) + (Get-Random –Minimum 100 –Maximum 10000)
    
        # Virtualized
        if ($HardwareVendor -eq "VMware Inc.") {$Virtualized = "True"} else {$Virtualized = "False"}
    
        # Wi-Fi Security Mode
        $WiFiSecurityMode = "Insecure","Secure","No Wi-Fi" | Get-Random
    
        # OS Updates
        $OSUpdates = "Up To Date","Pending Updates","Check Required" | Get-Random
    
        # User Privileges
        $UserPrivileges = "Limited","Privileged" | Get-Random

        # VPN Connected
        $VPNConnected = "True","False" | Get-Random

        # OS Type
        $OSType = "Client"
    
        # Secure Screen Saver
        $SecureScreenSaver = "True","False" | Get-Random

        # Individual Information
        switch ($Category) {
            "IGEL" {
                $AntiVirusName = $AntiVirusStatus = $AntiVirusSignatureStatus = $FirewallName = $FirewallStatus = $OSDiskEncryption = $OSRelease = $OSUpdates = $UserAuthentication = $VPNConnected = "Unsupported OS"
                $DeviceType = "IGEL (Managed)","IGEL (Unmanaged)" | Get-Random
                if ($DeviceType -eq "IGEL (Managed)") {$DeviceIdentifier = "192.168.171.124:30001","192.168.84.41:30001" | Get-Random}
                if ($DeviceType -eq "IGEL (Unmanaged)") {$DeviceIdentifier = "172.168.178.111:30999","192.100.1.11:30001","192.168.178.111:30001" | Get-Random}
                $DeviceTrustClient = "Available"
                $HardwareVendor = "IGEL Inc.","VMware Inc.","HP Ltd.","Fujitsu GmbH" | Get-Random
                switch ($HardwareVendor ) {
                    "IGEL Inc." {$HardwareModel = "UD Pocket","UD Pocket2","UD2","UD5","UD7" | Get-Random}
                    "HP Ltd." {$HardwareModel = "Mobile345c"}
                    "Fujitsu GmbH" {$HardwareModel = "Mobile345c"}
                    "VMware Inc." {$HardwareModel = "VMware7.1"}
                }
                if ($HardwareVendor -eq "VMware Inc.") {$HardwareRole = "Virtual"} else {$HardwareRole = "Desktop"}
                $OSPlatform = "x64"
                $OSVersion = "10.05.090","10.06.110","10.06.110","10.06.110","11.02.110","11.03.240","11.04.270""11.04.270","11.04.20","11.04.270","11.08.110","11.08.130","11.08.150","11.09.120","11.08.160" | Get-Random 
                if ($OSVersion -like "10.*") {$OSDescription = "IGEL Universal Desktop OS 3 (UC1-LX ac)"} else {$OSDescription = "IGEL OS 11 (UC1-LX X)"}
                if ($DeviceType -eq "IGEL (Managed)") {$SecurityState = "Protected"} else {$SecurityState = "Unprotected"}
                switch ($DeviceType) {
                    "IGEL (Managed)" {$UserPrivileges = "Limited","Privileged" | Get-Random}
                    "IGEL (Unmanaged)" {$UserPrivileges = "Privileged"}
                }
            }
            "macOS" {
                $AntiVirusName = $AntiVirusStatus = $AntiVirusSignatureStatus = $HardwareBiosReleaseDate = $HardwareSecureBoot = $OSDescription = $OSDiskEncryption = $OSRelease = $OSType = $RemoteControlled = "Unsupported OS"
                $DeviceType = "macOS"
                $DeviceIdentifier = New-Guid
                $FirewallName = "macOS Application Firewall"
                $FirewallStatus = "Active","Inactive" | Get-Random
                $HardwareVendor = "VMware Inc.","Apple Inc." | Get-Random
                switch ($HardwareVendor) {
                    "Apple Inc." {$HardwareModel = "MacBook10.1","MacBook5.2","MacBook8.1","MacBook9.1","iMac19.1","iMac20.2" | Get-Random}
                    "VMware Inc." {$HardwareModel = "VMware7.1"}
                }
                if ($HardwareVendor -eq "Apple Inc." -and $HardwareModel -like "MacBook*") {$HardwareRole = "Laptop"}
                if ($HardwareVendor -eq "Apple Inc." -and $HardwareModel -like "iMac*") {$HardwareRole = "Desktop"}
                if ($HardwareVendor -eq "VMware Inc.") {$HardwareRole = "Virtual"}
                $OSPlatform = "x64"
                $OSVersion = "11.2.2","10.15.7","10.14.6","10.13.6","10.12.6","11.2.2","10.15.7","10.13.6","10.16.1","11.2.2" | Get-Random 
                if ($FirewallStatus -eq "Active") {$SecurityState = "Protected"} else {$SecurityState = "Unprotected"}
                $UserAuthentication = "ShadowHash"
            }
            "Windows" {
                $AntiVirusName = "Microsoft Defender Antivirus","Not installed","eset Antivirus","McAfee Anti Virus" | Get-Random
                if ($AntiVirusName -eq "Not installed") {$AntiVirusStatus = "Not applicable"} else {$AntiVirusStatus = "Active","Inactive" | Get-Random} 
                if ($AntiVirusName -eq "Not installed") {$AntiVirusSignatureStatus = "Not applicable"} else {$AntiVirusSignatureStatus = "Up-To-Date","Out-Of-Date" | Get-Random}
                $DeviceType = "Windows (Azure AD)","Windows (Domain)","Windows (Workgroup)" | Get-Random
                switch ($DeviceType) {
                    "Windows (Azure AD)" {
                        $DeviceIdentifier = "ac2123e7-fe2e-41c9-22bc-f4fg6af6ba08","ba213327-ghee-e1c7-2245-z4fh6af6ba08" | Get-Random
                    }
                    "Windows (Domain)" {
                        $DeviceIdentifier = "S-1-5-21-1397108472-4176295369-1616608269","S-1-5-21-2748017931-9635926714-9628066151","S-1-5-21-2723423931-2342346713-3333332423" | Get-Random
                    }
                    "Windows (Workgroup)"{
                        $DeviceIdentifier = "Not applicable"
                    }
                }
                $FirewallName = "Microsoft Defender Firewall","Windows Firewall","Not installed" | Get-Random
                if ($FirewallName -ne "Not installed") {$FirewallStatus = "Active","Inactive" | Get-Random} else {$FirewallStatus = "Not applicable"}
                $HardwareVendor = "Apple Inc.","DELL Inc.","Fujitsu GmbH","HP Ltd.","LENOVO","Microsoft Ltd.","Thoshiba Inc.","VMware Inc." | Get-Random
                if ($HardwareVendor -eq "VMware Inc.") {$HardwareModel = "VMware7.1"} else {$HardwareModel = "12M10DO1EE","20M9CTO1WW","EliteBook19a""PC2344XY","PC234ABC","ProBook10.1","ProBook20.2","ProBook7.1" | Get-Random}   
                if ($HardwareVendor -eq "VMware Inc.") {$HardwareRole = "Virtual"} else {$HardwareRole = "Laptop"}
                $OSPlatform = "x64","x86" | Get-Random
                $OSUpdates = "Up To Date","Pending Updates","Check Required" | Get-Random
                $OSDiskEncryption = "True","False" | Get-Random
                $OSVersion = "10.0.17763","10.0.19042","10.191206","6.1.7601","6.3.1798" | Get-Random
                switch ($OSVersion) {
                    "10.0.17763" {
                        $OSDescription = "Windows 10 Enterprise LTSC 2019"
                        $OSRelease = "1809"
                    }
                    "10.0.19042" {
                        $OSDescription = "Windows 10 Pro"
                        $OSRelease = "2009"
                    }
                    "10.191206" {
                        $OSDescription = "Windows 7 Ultimate"
                        $OSRelease = "Unsupported OS"
                    }
                    "6.1.7601" {
                        $OSDescription = "Windows 8.1 Pro"
                        $OSRelease = "Unsupported OS"
                    }
                    "6.3.1798" {
                        $OSDescription = "Windows 10 Enterprise"
                        $OSRelease = "20H2"
                    }
                }
                $UserAuthentication = "Kerberos","Negotiate","CloudAP" | Get-Random
                $UserPrivileges = "Limited","Privileged with UAC","Privileged without UAC" | Get-Random
                if ($AntiVirusStatus -eq "Active" -and $FirewallStatus -eq "Active") {$SecurityState = "Protected"} else {$SecurityState = "Unprotected"}
            }
            "No Client" {
                $OSName = "IGEL","Windows","macOS" | Get-Random
                $DeviceTrustClient = "Unavailable"
                $DeviceIdentifier = $DeviceType = $EconomicRegion = $FirewallName = $FirewallStatus = $HardwareBiosReleaseDate = $HardwareModel = $HardwareRole = $HardwareSecureBoot = $HardwareVendor = $NetworkAddressAssignment = $NetworkDHCPServer = $NetworkDNSServer = $NetworkDNSSuffix = $NetworkGateway = $NetworkGatewayMac = $NetworkIPAddress = $NetworkMacAddress = $NetworkSubnet = $OSDescription = $OSDiskEncryption = $OSPlatform = $OSRelease = $OSType = $OSUpdates = $OSVersion = $RegionKeyboardLocale = $RegionLocale = $RegionTimezoneOffset = $RemoteControlled = $SecureScreenSaver = $SecurityState = $UserAuthentication = $UserPrivileges = $VPNConnected = $Virtualized = $WiFiSecurityMode = "No Client"
            }
        }
    
$json = @"
{
    "host": "$DeviceName",
    "index": "devicetrust",
    "sourcetype": "statusreport",
    "event": "Status Report Log Entry created for $DeviceName",
    "fields": {
        "SessionDate": "$SessionDate",
        "DeviceName": "$DeviceName",
        "AccessMode": "$AccessMode",
        "AntivirusName": "$AntiVirusName",
        "AntivirusStatus": "$AntiVirusStatus",
        "AntivirusSignatureStatus": "$AntiVirusSignatureStatus",
        "Country": "$Country",
        "CountryProvider": "$CountryProvider",
        "DeviceIdentifier": "$DeviceIdentifier",
        "DeviceType": "$DeviceType",
        "deviceTRUSTClient": "$DeviceTrustClient",
        "EconomicRegion": "$EconomicRegion",
        "FirewallName": "$FirewallName",
        "FirewallStatus": "$FirewallStatus",
        "HardwareBIOSReleaseDate": "$HardwareBiosReleaseDate",
        "HardwareModel": "$HardwareModel",
        "HardwareRole": "$HardwareRole",
        "HardwareSecureBoot": "$HardwareSecureBoot",
        "HardwareVendor": "$HardwareVendor",
        "NetworkAddressAssignment": "$NetworkAddressAssignment",
        "NetworkDHCPServer": "$NetworkDHCPServer",
        "NetworkDNSServer": "$NetworkDNSServer",
        "NetworkDNSSuffix": "$NetworkDNSSuffix",
        "NetworkGateway": "$NetworkGateway",
        "NetworkGatewayMac": "$NetworkGatewayMac",
        "NetworkIPAddress": "$NetworkIPAddress",
        "NetworkMacAddress": "$NetworkMacAddress",
        "NetworkSubnet": "$NetworkSubnet",
        "OSDescription": "$OSDescription",
        "OSDiskEncryption": "$OSDiskEncryption",
        "OSName": "$OSName",
        "OSPlatform": "$OSPlatform",
        "OSRelease": "$OSRelease",
        "OSType": "$OSType",
        "OSUpdates": "$OSUpdates",
        "OSVersion": "$OSVersion",
        "RegionKeyboardLocale": "$RegionKeyboardLocale",
        "RegionLocale": "$RegionLocale",
        "RegionTimezoneOffset": "$RegionTimezoneOffset",
        "RemoteControlled": "$RemoteControlled",
        "RemotingClientProtocol": "$RemoteClientProtocol",
        "RemotingClientVersion": "$RemoteClientVersion",
        "SecureScreenSaver": "$SecureScreenSaver",
        "SecurityState": "$SecurityState",
        "SessionUserDomain": "$SessionUserDomain",
        "SessionUserName": "$SessionUserName",
        "UserAuthentication": "$UserAuthentication",
        "UserPrivileges": "$UserPrivileges",
        "Virtualized": "$Virtualized",
        "VPNConnected": "$VPNConnected",
        "Wi-FiSecurityMode": "$WiFiSecurityMode"
    }
}
"@
        
        $Headers = @{
            Authorization = "Splunk 52e34312-63cd-41af-9db0-fb76212c34b5"
            ContentType = "application/json"
        }
        $json 
        Invoke-WebRequest -Uri "http://10.10.1.28:8088/services/collector" -Method "POST" -Body $json -Headers $Headers -UseBasicParsing | Out-Null
    
        $counter = $counter + 1
        
    }
    
    until ($counter -gt 1)

}