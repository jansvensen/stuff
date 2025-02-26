import-csv ./panos-add-addresses/panos-add-addresses.csv | ForEach-Object{
    $ip = $_.ip
    $name = $_.name

$headers = @{
    'X-PAN-KEY' = 'e6bc89fb5328bd40d3d62c13c5b7369c:R6epmZqQUzxO6pSgNufZiTU7_4nImDiNTkLlAVmLepq5qobKhJ35HR2iwKsDcuRyMO0aq2-DcohcUdCctCQ_sgJuPnVPlhtKZCLFTmNJBXF7iLTSV1wKkxScN02Td8QJFxUNnzWOe9UDxCmtRZ1S2FMbWxDiDC1SjmwudUJ1GzrKI8XkghgES2GazE8SJRqAYnrUkWylS7u1gdGpXKpUwsvPBexeEugFiU68Vo9Rx9P4UfrjIjE34x-WLciTdxuGv7ZvXfqbBFyS7Dhm5SLRMOR_x4paD0xj9Z_AkfUHbxbTcgK9SCVr-jvXRrPcK7Siyk2jYKEa7t_gPkd3ucCO6q40ncYf8GVQAAKjglUohEZfMwZ2e_-twpowmRiT8Yz6Cx9M4q5Gm8Qhfekl_LkbIIsbwXbeceC4BAtRriGOtZtEvKvjMGvnMpuW8gEZPnNAsiTHr-MOvkXfeFZjc-boIxJt42sJUH184KXhUe7z7rxmOHCuIHQgu-AN_hidmE-0GdZf-Jh3DKJJRvJgkFjH2q5PHM9G2Q99dLfgFtUzEt3L1BdxsWEDckt-bTPpLVS2Ru3cUKumqk1WYy44bqb0OGYMk-B8cGaICWC0GLyMm56hKKoxq5BOgvtvmSwk9LK1NK7vbUwXrtz_VrzECwLmK2aTAV3xFeZd7xWt8KkwlYF8qZMZA8jil6h3fVYJJ5IG'
    ContentType = "application/json"
}

$json = @"
{
"entry": [
    {
        "@name": "$name",
        "@location": "vsys",
        "@vsys": "vsys1",
        "ip-netmask": "$ip"
    }
]
}
"@    

$URI = 'https://192.168.110.2/restapi/v11.0/Objects/Addresses?location=vsys&vsys=vsys1&name=' + $name

Invoke-WebRequest -Uri $URI -Method "POST" -Body $json -Headers $Headers  -UseBasicParsing -SkipCertificateCheck # | Out-Null}
}