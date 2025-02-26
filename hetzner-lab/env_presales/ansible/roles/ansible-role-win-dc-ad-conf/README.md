# ansible-role-win-dc-ad-conf

This role creates an MS Active Directory domain.

## Requirements

- ansible-role-win-dc-ad-inst

## Role Variables

- dc_user_admin: The administrative username for creating the domain.
- dc_password_admin: The administrative user's password.
- win.domain.dnsname: The DNS domain name to be used.
- dc_password_safemode: The safemode password.

## Dependencies

- None

## License

- MIT

## Author Information

- Sven Jansen, github(at)jansvensen.de
