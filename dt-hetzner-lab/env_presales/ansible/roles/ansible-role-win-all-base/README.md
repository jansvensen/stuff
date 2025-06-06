# ansible-role-win-all-base

This role base-configures a Windows system to create a test remoting environment. Functions may change, so check for updated versions. The role includes (for now):

- Updating the PowerShell help content
- Copying a wallpaper to the files directory
- Setting the machine's hostname
- Configuring the language list

## Requirements

- None

## Role Variables

- hostname: The computer's hostname
- win.user.language: The desired user language (e.g. "en-US")

## Dependencies

- none

## License

- MIT

## Author Information

- Sven Jansen, github(at)jansvensen.de
