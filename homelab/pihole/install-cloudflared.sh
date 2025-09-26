# For Debian/Ubuntu
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo apt-get install ./cloudflared-linux-amd64.deb
cloudflared -v

# Create a cloudflared user to run the daemon:
sudo useradd -s /usr/sbin/nologin -r -M cloudflared

# Proceed to create a configuration file for cloudflared:
sudo nano /etc/default/cloudflared

# Commandline args for cloudflared, using Cloudflare DNS
CLOUDFLARED_OPTS=--port 5053 --upstream https://cloudflare-dns.com/dns-query

# Update the permissions for the configuration file and cloudflared binary to allow access for the cloudflared user:
sudo chown cloudflared:cloudflared /etc/default/cloudflared
sudo chown cloudflared:cloudflared /usr/local/bin/cloudflared

# Then create the systemd script by copying the following into /etc/systemd/system/cloudflared.service. This will control the running of the service and allow it to run on startup:
sudo nano /etc/systemd/system/cloudflared.service

[Unit]
Description=cloudflared DNS over HTTPS proxy
After=syslog.target network-online.target

[Service]
Type=simple
User=cloudflared
EnvironmentFile=/etc/default/cloudflared
ExecStart=/usr/local/bin/cloudflared proxy-dns $CLOUDFLARED_OPTS
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target

# Enable the systemd service to run on startup, then start the service and check its status:
sudo systemctl enable cloudflared
sudo systemctl start cloudflared
sudo systemctl status cloudflared

dig @127.0.0.1 -p 5053 google.com