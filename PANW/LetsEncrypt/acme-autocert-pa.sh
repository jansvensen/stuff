apt install -y acme

# cloudflare api token for edit jansvensen.de: aK711BvQxVQy26KEFLG0q_UneZlVtOkfm59kqyRt
export CF_Key="aK711BvQxVQy26KEFLG0q_UneZlVtOkfm59kqyRt" # Restricted Token - Not Working
export CF_Key="bee06ecc17848c386594e810030f2fc8535c2" # API Token - Working
export CF_Email="cloudflare@jansvensen.de"

# zerossl: zerossl@jansvensen.de / ACCOUNT_THUMBPRINT='9XKDrA7zVjZ4TYuPbhacaSYmsBDFjtd3U2rNLem-CQg'
EAB KID: CizsdCuE_UD3_L2fFSkVMA
EAB HMAC Key: 0BUMClfE-RqFRaiJioPC-XN4SLQ7nRakfGc92D6HLl7m2h-7P6i5P-qO2bKl8_IQnX-dzAS8j530O0AxyDI6bw

./acme.sh --register-account --server zerossl --eab-kid CizsdCuE_UD3_L2fFSkVMA --eab-hmac-key xxxx0BUMClfE-RqFRaiJioPC-XN4SLQ7nRakfGc92D6HLl7m2h-7P6i5P-qO2bKl8_IQnX-dzAS8j530O0AxyDI6bwxxxx

./acme.sh --log --issue --dns dns_cf -d jansvensen.de -d '*.jansvensen.de'

# PANW admin variables

export PANOS_USER="apiadmin"
export PANOS_PASS="Banane2000!"
export PANOS_HOST="192.168.110.2"

./acme.sh --deploy -d jansvensen.de --deploy-hook panos --insecure 