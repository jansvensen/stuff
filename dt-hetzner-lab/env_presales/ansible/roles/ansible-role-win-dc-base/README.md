# ansible-role-win-dc-base

This role base-configures a Windows DC to create a test remoting environment. Functions may change, so check for updated versions. The role includes (for now):

- Set the password for the local administrator
- Set the password for the local administrator to be required
- Set upstream DNS server
- Configure NTP Servers

## Requirements

- None

## Role Variables

- dc_password_admin: The admin's password
- dc_dns_upstream: DNS upstream server IP addresses
- dc_ntp_servers: NTP server IP addresses

## Dependencies

- none

## License

- MIT

## Author Information

- Sven Jansen, github(at)jansvensen.de
