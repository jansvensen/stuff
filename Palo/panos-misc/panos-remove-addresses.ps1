# Set the firewall IP, username, and password
$firewallIp = "192.168.110.2"
$username = "apiadmin"
$password = "Banane2000!"

# Create the body for this login
$body = @{
    user = $username
    password = $password 
}

# Create the Login URL
$loginUrl = "https://$firewallIp/api/?type=keygen&user=$username&password=$password"

# Execute the REST API call and extract the API key from the response
$apiKey = (Invoke-RestMethod -Uri $loginUrl -Method Post -Body $body -ContentType "application/x-www-form-urlencoded").response.result.key

$headers = @{
    "X-PAN-KEY" = "$apiKey"
    ContentType = "application/json"
}

# Create the URL for address object retrieval
$uri = "https://$firewallIp/restapi/v11.0/Objects/Addresses?location=vsys&vsys=vsys1"

# Make a GET request to retrieve the address objects
(Invoke-RestMethod -Uri $uri -Method "GET" -Headers $Headers -UseBasicParsing).Result.entry | Where-Object{$_.'@name' -match "Object"} |ForEach-Object {
    $name = $_.'@name'
    $uri = "https://$firewallIp/restapi/v11.0/Objects/Addresses?location=vsys&vsys=vsys1&name=$name"
    
    # Make a DELETE request to delete the address object
    Invoke-RestMethod -Uri $uri -Method "DELETE" -Headers $Headers
}