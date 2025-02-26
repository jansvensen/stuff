$baseUrl = "https://your-strata-cloud-manager-api-url.com/api"
$username = "your-username"
$password = "your-password"

$loginEndpoint = "$baseUrl/login"

# Create a new session
$session = New-Object System.Net.Http.HttpClient

# Define the credentials
$credentials = New-Object System.Management.Automation.PSCredential -ArgumentList ($username, (ConvertTo-SecureString -String $password -AsPlainText -Force))

# Authenticate by sending a POST request to the login endpoint
$loginResponse = $session.PostAsync($loginEndpoint, ($credentials.GetNetworkCredential().UserName, $credentials.GetNetworkCredential().Password)).Result

# Check the response status code
if ($loginResponse.StatusCode -eq [System.Net.HttpStatusCode]::OK) {
    Write-Output "Login successful!"
}
else {
    Write-Output "Login failed. Please check your credentials."
}

# You can now continue making authenticated requests using the session object
# For example:
# $response = $session.GetAsync("$baseUrl/some-endpoint").Result
# $responseContent = $response.Content.ReadAsStringAsync().Result

# Don't forget to dispose the session when you're done
$session.Dispose()