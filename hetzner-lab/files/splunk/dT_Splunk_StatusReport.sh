# Array of applications
Categories=("IGEL" "macOS" "Windows" "No Client")

# Loop through each application
for Category in "${Categories[@]}"; do
    Counter=1

    # Loop to generate entries for each application
    while [ "$Counter" -le 1000 ]; do

        TrueFalseArray=("true" "false")

        RANDOM=$$$(date +%s)

        deviceTRUSTClient="Available"

        # Session Date
        SessionDate=$(date -u -d "@$((($(date +%s) - (RANDOM % 4752000)) - (RANDOM % 1814400) - (RANDOM % 90000) - (RANDOM % 5400) - (RANDOM % 3600)))" +"%Y-%m-%dT%H:%M:%S.000Z")

        # Generate a random device
        DeviceArray=("DTLDTW" "ITC" "DE-DT" "UK-DT" "US-DT" "TCDT")
        DevicePosition=${DeviceArray[$RANDOM % ${#DeviceArray[@]}]}
        DeviceSuffix=$(printf "%05d\n" $((RANDOM % 10000 + 1)))
        DeviceName="${DevicePosition}${DeviceSuffix}"

        # Access Mode
        AccessModeArray=("External" "Internal")
        AccessMode=${AccessModeArray[$RANDOM % ${#AccessModeArray[@]}]}

        # Country
        CountryArray=("CA" "CN" "DE" "NL" "RU" "UK" "US" "Unknown")
        Country=${CountryArray[$RANDOM % ${#CountryArray[@]}]}

        # Country Provider
        if [ "$Country" != "Unknown" ]; then
            CountryProviderArray=("Whois" "ThirdParty WiFi")
            CountryProvider="${CountryProviderArray[RANDOM % ${#CountryProviderArray[@]} ]}"
        else
            CountryProvider="Unknown"
        fi

        # Hardware BIOS Release Date
        HardwareBiosReleaseDate=$(date -u -d "@$((($(date -u -d "$SessionDate" +%s) - (RANDOM % 2678400)) - (RANDOM % 90000) - (RANDOM % 5400) - (RANDOM % 3600)))" +"%Y-%m-%dT%H:%M:%S.000Z")

        # Hardware Secure Boot
        HardwareSecureBoot=${TrueFalseArray[$RANDOM % ${#TrueFalseArray[@]}]}

        # Economic Region
        case $Country in
            "DE" ) EconomicRegion="EMEA" ;;
            "NL" ) EconomicRegion="EMEA" ;;
            "UK" ) EconomicRegion="EMEA" ;;
            "US" ) EconomicRegion="AMER" ;;
            "CA" ) EconomicRegion="AMER" ;;
            "CN" ) EconomicRegion="APAC" ;;
            "RU" ) EconomicRegion="APAC" ;;
            "Unknown" ) EconomicRegion="Unknown" ;;
        esac

        # Network Address Assignment
        NetworkAddressAssignmentArray=("DHCP" "Static")
        NetworkAddressAssignment=${NetworkAddressAssignmentArray[$RANDOM % ${#NetworkAddressAssignmentArray[@]}]}

        # Network IP Address
        NetworkIPAddresses=("10.100.123." "10.199.12." "17.123.77." "192.168.0." "192.168.122." "192.168.17.")
        NetworkIPAddress=${NetworkIPAddresses[$((RANDOM % ${#NetworkIPAddresses[@]}))]}$((RANDOM % (255 - 10) + 10))


        # Network Mac Address
        NetworkMacAddress=$(printf "%02x:%02x:%02x:%02x:%02x:%02x\n" $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)))

        case $NetworkIPAddress in
            192.168.0.* )
                NetworkSubnet="192.168.0.0/24"
                NetworkGateway="192.168.0.1"
                NetworkGatewayMac=$(printf "%02x:%02x:%02x:%02x:%02x:%02x\n" $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)))
                NetworkDHCPServer="192.168.0.1"
                NetworkDNSServer="192.168.0.1"
                NetworkDNSSuffix="fritz.box"
                ;;
            192.168.17.* )
                NetworkSubnet="192.168.17.0/24"
                NetworkGateway="192.168.17.253"
                NetworkGatewayMac=$(printf "%02x:%02x:%02x:%02x:%02x:%02x\n" $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)))
                NetworkDHCPServer="192.168.17.253"
                NetworkDNSServer="192.168.17.253"
                NetworkDNSSuffix="myhome.local"
                ;;
            192.168.122.* )
                NetworkSubnet="192.168.122.0/23"
                NetworkGateway="192.168.122.1"
                NetworkGatewayMac=$(printf "%02x:%02x:%02x:%02x:%02x:%02x\n" $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256)))
                NetworkDHCPServer="192.168.122.1"
                NetworkDNSServer="192.168.122.1"
                NetworkDNSSuffix="corporate.net"
                ;;
            10.100.123.* )
                NetworkSubnet="10.100.123.0/20"
                NetworkGateway="10.100.123.244"
                NetworkGatewayMac="0A-51-52-E2-49-41"
                NetworkDHCPServer="10.100.123.254"
                NetworkDNSServer="10.100.123.253"
                NetworkDNSSuffix="de.corporate.local"
                ;;
            10.199.12.* )
                NetworkSubnet="10.199.12.0/23"
                NetworkGateway="10.199.12.114"
                NetworkGatewayMac="0B-67-34-E1-8B-22"
                NetworkDHCPServer="10.199.12.111"
                NetworkDNSServer="10.199.12.110"
                NetworkDNSSuffix="uk.corporate.local"
                ;;
            17.123.77.* )
                NetworkSubnet="17.123.77.0/21"
                NetworkGateway="17.123.77.1"
                NetworkGatewayMac="0C-78-21-F0-A9-10"
                NetworkDHCPServer="17.123.77.2"
                NetworkDNSServer="17.123.77.3"
                NetworkDNSSuffix="us.corporate.local"
                ;;
            * )
                # Default values or error handling as needed
                ;;
        esac

        # OS Name
        OSName="$Category"
    
        # Region Keyboard Locale
        RegionKeyboardLocales=("de-DE" "en-CA" "en-UK" "en-US" "nl-NL" "ru-RU" "zh-CN")
        RegionKeyboardLocale=${RegionKeyboardLocales[$((RANDOM % ${#RegionKeyboardLocales[@]}))]}
    
        # Region Locale
        RegionLocale=$RegionKeyboardLocale

        # Region Timezone Offset
        RegionTimezoneOffsets=(-480 -360 -240 -120 -60 0 60 120 240 360)
        RegionTimezoneOffset=${RegionTimezoneOffsets[$((RANDOM % ${#RegionTimezoneOffsets[@]}))]}

        # Remote Controlled
        RemoteControlled=${TrueFalseArray[$((RANDOM % ${#TrueFalseArray[@]}))]}

        # Remoting Client Protocol
        RemotingClientProtocols=("WSP" "Blast" "ICA" "PCoIP" "RDP")
        RemotingClientProtocol=${RemotingClientProtocols[$((RANDOM % ${#RemotingClientProtocols[@]}))]}

        # Remoting Client Version
        if [ "$RandomRemotingClientProtocol" == "ICA" ] || [ "$RandomRemotingClientProtocol" == "Blast" ]; then
            RemotingClientVersions=("16.9.01.01" "17.06.01.01" "18.3.07.10" "19.3.0.5" "20.1.23.21" "20.1.23.21" "20.1.45.11" "20.12.0.12" "20.9.0.3" "21.02.0.25")
            RemotingClientVersion=${RemotingClientVersions[$((RANDOM % ${#RemotingClientVersions[@]}))]}
        else
            RemotingClientVersion="Unavailable"
        fi

        # Session User Domain
        SessionUserDomains=("CORPORATE" "company.local" "uk.corporate.local" "us.corporate.local" "de.corporate.local" "UK.local" "US.local" "DE.local" "Germany" "GLOBAL")
        SessionUserDomain=${SessionUserDomains[$((RANDOM % ${#SessionUserDomains[@]}))]}

        # Session User Name
        SessionUserNames=("UsEA" "IDBE" "DEBB" "UKDA" "USWC" "UID2" "PUID" "GLUK" "DEV" "Test")
        SessionUserName="${SessionUserNames[$((RANDOM % ${#SessionUserNames[@]}))]}$((RANDOM % (10000 - 100) + 100))"

        # Virtualized
        if [ "$HardwareVendor" == "VMware Inc." ]; then
            Virtualized="True"
        else
            Virtualized="False"
        fi

        # VPN Connected
        VPNConnected=${TrueFalseArray[$((RANDOM % ${#TrueFalseArray[@]}))]}

        # Wi-Fi Security Mode
        WiFiSecurityModes=("Insecure" "Secure" "No Wi-Fi")
        WiFiSecurityMode=${WiFiSecurityModes[$((RANDOM % ${#WiFiSecurityModes[@]}))]}

        # OS Type
        OSType="Client"

        # Secure Screen Saver
        SecureScreenSaver=${TrueFalseArray[$((RANDOM % ${#TrueFalseArray[@]}))]}

    # Individual Information
    case $Category in
        "IGEL")
            AntiVirusName="Unsupported OS"
            AntiVirusStatus="Unsupported OS"
            AntiVirusSignatureStatus="Unsupported OS"
            FirewallName="Unsupported OS"
            FirewallStatus="Unsupported OS"
            OSDiskEncryption="Unsupported OS"
            OSRelease="Unsupported OS"
            OSUpdates="Unsupported OS"
            UserAuthentication="Unsupported OS"
            VPNConnected="Unsupported OS"

            DeviceTypes=("IGEL (Managed)" "IGEL (Unmanaged)")
            DeviceType=${DeviceTypes[$((RANDOM % ${#DeviceTypes[@]}))]}

            case $DeviceType in
                "IGEL (Managed)")
                    DeviceIdentifiers=("192.168.171.124:30001" "192.168.84.41:30001")
                    DeviceIdentifier=${DeviceIdentifiers[$((RANDOM % ${#DeviceIdentifiers[@]}))]}
                    ;;
                "IGEL (Unmanaged)")
                    DeviceIdentifiers=("172.168.178.111:30999" "192.100.1.11:30001" "192.168.178.111:30001")
                    DeviceIdentifier=${DeviceIdentifiers[$((RANDOM % ${#DeviceIdentifiers[@]}))]}
                    ;;
            esac

            HardwareVendors=("IGEL Inc." "VMware Inc." "HP Ltd." "Fujitsu GmbH")
            HardwareVendor=${HardwareVendors[$((RANDOM % ${#HardwareVendors[@]}))]}

            case $HardwareVendor in
                "IGEL Inc.")
                    HardwareModels=("UD Pocket" "UD Pocket2" "UD2" "UD5" "UD7")
                    HardwareModel=${UserPrivHardwareModelsleges[$((RANDOM % ${#HardwareModels[@]}))]}
                    ;;
                "HP Ltd.")
                    HardwareModel="Mobile345c"
                    ;;
                "Fujitsu GmbH")
                    HardwareModel="Mobile345c"
                    ;;
                "VMware Inc.")
                    HardwareModel="VMware7.1"
                    ;;
            esac

            [ "$HardwareVendor" == "VMware Inc." ] && HardwareRole="Virtual" || HardwareRole="Desktop"

            OSPlatform="x64"
            OSVersions=("10.05.090" "10.06.110" "10.06.110" "10.06.110" "11.02.110" "11.03.240" "11.04.270""11.04.270" "11.04.20" "11.04.270" "11.08.110" "11.08.130" "11.08.150" "11.09.120" "11.08.160")
            OSVersion=${OSVersions[$((RANDOM % ${#OSVersions[@]}))]}

            [ "$OSVersion" == "10.*" ] && OSDescription="IGEL Universal Desktop OS 3 (UC1-LX ac)" || OSDescription="IGEL OS 11 (UC1-LX X)"

            [ "$DeviceType" == "IGEL (Managed)" ] && SecurityState="Protected" || SecurityState="Unprotected"

            case $DeviceType in
                "IGEL (Managed)")
                    UserPrivilegesArray=("Limited" "Privileged")
                    UserPrivileges=${UserPrivilegesArray[$((RANDOM % ${#UserPrivilegesArray[@]}))]}
                    ;;
                "IGEL (Unmanaged)")
                    UserPrivileges="Privileged"
                    ;;
            esac
            ;;
        
        "macOS")
            AntiVirusName="Unsupported OS"
            AntiVirusStatus="Unsupported OS"
            AntiVirusSignatureStatus="Unsupported OS"
            HardwareBiosReleaseDate="Unsupported OS"
            HardwareSecureBoot="Unsupported OS"
            OSDescription="Unsupported OS"
            OSDiskEncryption="Unsupported OS"
            OSRelease="Unsupported OS"
            OSType="Unsupported OS"
            RemoteControlled="Unsupported OS"

            DeviceType="macOS"
            DeviceIdentifier=$(uuidgen)

            FirewallName="macOS Application Firewall"
            FirewallStatusArray=("Active" "Inactive")
            FirewallStatus=${FirewallStatusArray[$((RANDOM % ${#FirewallStatusArray[@]}))]}

            HardwareVendors=("VMware Inc." "Apple Inc.")
            HardwareVendor=${HardwareVendors[$((RANDOM % ${#HardwareVendors[@]}))]}

            case $HardwareVendor in
                "Apple Inc.")
                    HardwareModels=("MacBook10.1" "MacBook5.2" "MacBook8.1" "MacBook9.1" "iMac19.1" "iMac20.2")
                    HardwareModel=${HardwareModels[$((RANDOM % ${#HardwareModels[@]}))]}
                    [ "$HardwareModel" == "MacBook*" ] && HardwareRole="Laptop"
                    [ "$HardwareModel" == "iMac*" ] && HardwareRole="Desktop"
                    ;;
                "VMware Inc.")
                    HardwareModel="VMware7.1"
                    HardwareRole="Virtual"
                    ;;
            esac

            OSPlatform="x64"
            OSVersions=("11.2.2" "10.15.7" "10.14.6" "10.13.6" "10.12.6" "11.2.2" "10.15.7" "10.13.6" "10.16.1" "11.2.2")
            OSVersion=${OSVersions[$((RANDOM % ${#OSVersions[@]}))]}

            [ "$FirewallStatus" == "Active" ] && SecurityState="Protected" || SecurityState="Unprotected"

            UserAuthentication="ShadowHash"
            ;;
        
        "Windows")
            AntiVirusNames=("Microsoft Defender Antivirus" "Not installed" "eset Antivirus" "McAfee Anti Virus")
            AntiVirusName=${AntiVirusNames[$((RANDOM % ${#AntiVirusNames[@]}))]}

            [ "$AntiVirusName" == "Not installed" ] && AntiVirusStatus="Not applicable" || AntiVirusStatus=("Active" "Inactive")
            [ "$AntiVirusName" == "Not installed" ] && AntiVirusSignatureStatus="Not applicable" || AntiVirusSignatureStatus=("Up-To-Date" "Out-Of-Date")

            DeviceTypes=("Windows (Azure AD)" "Windows (Domain)" "Windows (Workgroup)")
            DeviceType=${DeviceTypes[$((RANDOM % ${#DeviceTypes[@]}))]}

            case $DeviceType in
                "Windows (Azure AD)")
                    DeviceIdentifiers=("ac2123e7-fe2e-41c9-22bc-f4fg6af6ba08" "ba213327-ghee-e1c7-2245-z4fh6af6ba08")
                    DeviceIdentifier=${DeviceIdentifiers[$((RANDOM % ${#DeviceIdentifiers[@]}))]}
                    ;;
                "Windows (Domain)")
                    DeviceIdentifiers=("S-1-5-21-1397108472-4176295369-1616608269" "S-1-5-21-2748017931-9635926714-9628066151" "S-1-5-21-2723423931-2342346713-3333332423")
                    DeviceIdentifier=${DeviceIdentifiers[$((RANDOM % ${#DeviceIdentifiers[@]}))]}
                    ;;
                "Windows (Workgroup)")
                    DeviceIdentifier="Not applicable"
                    ;;
            esac

            FirewallName=("Microsoft Defender Firewall" "Windows Firewall" "Not installed")
            [ "$FirewallName" != "Not installed" ] && FirewallStatus=("Active" "Inactive") || FirewallStatus="Not applicable"

            HardwareVendors=("Apple Inc." "DELL Inc." "Fujitsu GmbH" "HP Ltd." "LENOVO" "Microsoft Ltd." "Thoshiba Inc." "VMware Inc.")
            HardwareVendor=${HardwareVendors[$((RANDOM % ${#HardwareVendors[@]}))]}

            [ "$HardwareVendor" == "VMware Inc." ] && HardwareModel="VMware7.1" || HardwareModel=("12M10DO1EE" "20M9CTO1WW" "EliteBook19a" "PC2344XY" "PC234ABC" "ProBook10.1" "ProBook20.2" "ProBook7.1")
            [ "$HardwareVendor" == "VMware Inc." ] && HardwareRole="Virtual" || HardwareRole="Laptop"

            # OSPlatform
            OSPlatforms=("x64" "x86")
            OSPlatform=${OSPlatforms[$((RANDOM % ${#OSPlatforms[@]}))]}

            # OSUpdates
            OSUpdates=("Up To Date" "Pending Updates" "Check Required")
            OSUpdate=${OSUpdates[$((RANDOM % ${#OSUpdates[@]}))]}

            # OSDiskEncryption
            OSDiskEncryption=${TrueFalseArray[$((RANDOM % ${#TrueFalseArray[@]}))]}

            # OSVersion
            OSVersions=("10.0.17763" "10.0.19042" "10.191206" "6.1.7601" "6.3.1798")
            OSVersion=${OSVersions[$((RANDOM % ${#OSVersions[@]}))]}

            case $OSVersion in
                "10.0.17763")
                    OSDescription="Windows 10 Enterprise LTSC 2019"
                    OSRelease="1809"
                    ;;
                "10.0.19042")
                    OSDescription="Windows 10 Pro"
                    OSRelease="2009"
                    ;;
                "10.191206")
                    OSDescription="Windows 7 Ultimate"
                    OSRelease="Unsupported OS"
                    ;;
                "6.1.7601")
                    OSDescription="Windows 8.1 Pro"
                    OSRelease="Unsupported OS"
                    ;;
                "6.3.1798")
                    OSDescription="Windows 10 Enterprise"
                    OSRelease="20H2"
                    ;;
            esac

            UserAuthentication=("Kerberos" "Negotiate" "CloudAP")
            UserPrivileges=("Limited" "Privileged with UAC" "Privileged without UAC")
            
            [ "$AntiVirusStatus" == "Active" ] && [ "$FirewallStatus" == "Active" ] && SecurityState="Protected" || SecurityState="Unprotected"
            ;;

        "No Client")
            OSNames=("IGEL" "Windows" "macOS")
            OSName=${OSNames[$((RANDOM % ${#OSNames[@]}))]}

            deviceTRUSTClient="Unavailable"

            DeviceIdentifier="No Client"
            DeviceType="No Client"
            EconomicRegion="No Client"
            FirewallName="No Client"
            FirewallStatus="No Client"
            HardwareBiosReleaseDate="No Client"
            HardwareModel="No Client"
            HardwareRole="No Client"
            HardwareSecureBoot="No Client"
            HardwareVendor="No Client"
            NetworkAddressAssignment="No Client"
            NetworkDHCPServer="No Client"
            NetworkDNSServer="No Client"
            NetworkDNSSuffix="No Client"
            NetworkGateway="No Client"
            NetworkGatewayMac="No Client"
            NetworkIPAddress="No Client"
            NetworkMacAddress="No Client"
            NetworkSubnet="No Client"
            OSDescription="No Client"
            OSDiskEncryption="No Client"
            OSPlatform="No Client"
            OSRelease="No Client"
            OSType="No Client"
            OSUpdates="No Client"
            OSVersion="No Client"
            RegionKeyboardLocale="No Client"
            RegionLocale="No Client"
            RegionTimezoneOffset="No Client"
            RemoteControlled="No Client"
            SecureScreenSaver="No Client"
            SecurityState="No Client"
            UserAuthentication="No Client"
            UserPrivileges="No Client"
            VPNConnected="No Client"
            Virtualized="No Client"
            WiFiSecurityMode="No Client"
            ;;
    esac


        # Construct JSON payload
        json=$(cat <<-EOF
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
        "deviceTRUSTClient": "$deviceTRUSTClient",
        "EconomicRegion": "$EconomicRegion",
        "FirewallName": "$FirewallName",
        "FirewallStatus": "$FirewallStatus",
        "HardwareBiosReleaseDate": "$HardwareBiosReleaseDate",
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
        "RemotingClientProtocol": "$RemotingClientProtocol",
        "RemotingClientVersion": "$RemotingClientVersion",
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
EOF
)
        # Send JSON payload to Splunk
        curl -s -o /dev/null -X POST -H "Authorization: Splunk 52e34312-63cd-41af-9db0-fb76212c34b5" -H "Content-Type: application/json" -d "$json" http://10.10.1.151:8088/services/collector

        Counter=$((Counter + 1))
    done
done