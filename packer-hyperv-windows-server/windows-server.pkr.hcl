{
  "builders": [
    {
      "type": "hyperv-iso",
      "iso_url": "path/to/iso/en_windows_server_2019_x64_dvd_4cb967d8.iso",
      "iso_checksum": "sha256:checksum",
      "iso_checksum_type": "sha256",
      "vm_name": "windows-server-2019",
      "output_directory": "output-hyperv-iso",
      "shutdown_command": "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Shutdown\"",
      "disk_size": 51200,
      "memory": 2048,
      "cpus": 2,
      "hyperv_generation": "2",
      "switch_name": "External",
      "guest_os_type": "Windows2019Server_64",
      "winrm_username": "Administrator",
      "winrm_password": "password",
      "winrm_port": 5985,
      "winrm_timeout": "10m",
      "winrm_use_ssl": false,
      "winrm_insecure": true,
      "boot_wait": "2m",
      "boot_command": [
        "<Tab><Tab> ",
        "/installfrom:/sources/install.wim",
        "/unattend:/Autounattend.xml",
        "<Enter>"
      ],
      "floppy_files": [
        "answer_files/Autounattend.xml"
      ]
    }
  ],
  "provisioners": [
    {
      "type": "powershell",
      "inline": [
        "Install-WindowsFeature -Name Web-Server -IncludeManagementTools",
        "Set-ItemProperty -Path 'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' -Name 'EnableLUA' -Value 0"
      ]
    }
  ]
}
