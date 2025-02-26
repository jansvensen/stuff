# Array of applications
Applications=("Adobe Acrobat DC" "Microsoft Office" "Microsoft Project" "Microsoft Visio")

# Loop through each application
for Application in "${Applications[@]}"; do
    Counter=1

    # Loop to generate entries for each application
    while [ "$Counter" -le 15000 ]; do
        # Generate a random user
        UserArray=("UseCase" "User" "ID")
        UserPosition=$((RANDOM % 3))
        User="${UserArray[$UserPosition]}"
        UserSuffix=$(printf "%05d\n" $((RANDOM % 10000 + 1)))
        User="${User}${UserSuffix}"

        # Generate a random domain
        DomainArray=("CORPORATE" "company.local" "uk.corporate.local" "us.corporate.local" "de.corporate.local")
        DomainPosition=$((RANDOM % 5))
        Domain="${DomainArray[$DomainPosition]}"

        # Generate a random device
        DeviceArray=("DTLDTW" "ITC" "DE-DT" "UK-DT" "US-DT" "TCDT")
        DevicePosition=$((RANDOM % 6))
        Device="${DeviceArray[$DevicePosition]}"
        DeviceSuffix=$(printf "%05d\n" $((RANDOM % 10000 + 1)))
        Device="${Device}${DeviceSuffix}"

        # Generate a random license status
        LicensedStatusArray=("Licensed by BIOS Serial" "Not licensed" ... "Licensed by Device Name")
        LicensedStatusPosition=$((RANDOM % 23))
        LicensedStatus="${LicensedStatusArray[$LicensedStatusPosition]}"

        # Generate random hardware UUIDs
        DEVICE_HARDWARE_BIOS_SERIAL=$(cat /proc/sys/kernel/random/uuid)
        DEVICE_OS_ID=$(cat /proc/sys/kernel/random/uuid)

        # Generate random application user state
        ApplicationUserState="False"
        ApplicationUserStateRandom=$((RANDOM % 100))
        if [ "$ApplicationUserStateRandom" -lt "25" ]; then
            ApplicationUserState="True"
        fi

        # Get the current date and time in seconds since the epoch
        currentTimestamp=$(date +%s)

        # Generate a random number of seconds within the last 5 years
        rSeconds=$((RANDOM % 60))
        rMinutes=$((RANDOM % 60))
        rHours=$((RANDOM % 24))
        rDays=$((RANDOM % 365))
        rYears=$((RANDOM % 5))
        randomSeconds=$((rSeconds + (rMinutes * 60) + (rHours * 60 * 60) + (rDays * 24 * 60 *60) + (rYears * 365 * 24 * 60 * 60) ))

        # Calculate the random date by subtracting the random seconds from the current timestamp
        SessionDate=$(date -u -d "@$((currentTimestamp - randomSeconds))" +"%Y-%m-%dT%H:%M:%S.000Z")

        # Construct JSON payload
        json=$(cat <<-EOF
{
    "host": "$DeviceName",
    "index": "devicetrust",
    "sourcetype": "devicebasedlicensing",
    "event": "Device based licensing Log Entry created for Application: $Application on Device: $DeviceName",
    "fields": {
        "Application": "$Application",
        "SessionDate": "$SessionDate",
        "LicensedStatus": "$LicensedStatus",
        "DeviceName": "$Device",
        "DeviceBIOSSerialNumber": "$DEVICE_HARDWARE_BIOS_SERIAL",
        "DeviceOSID": "$DEVICE_OS_ID",
        "ApplicationUser": "$ApplicationUserState",
        "SessionUserDomain": "$Domain",
        "SessionUserName": "$User"
    }
}
EOF
)

        # Send JSON payload to Splunk
        curl -s -o /dev/null -X POST -H "Authorization: Splunk 52e34312-63cd-41af-9db0-fb76212c34b5" -H "Content-Type: application/json" -d "$json" http://10.10.1.151:8088/services/collector

        Counter=$((Counter + 1))
    done
done