
# I highly recommend using some type of provisioner as packer does not like it when you don't have any provisioners.
# If you are having issues, it is very likely IPv6 related. Or you rebooted the machine and WinRM is not ready yet. Or WinRM is just having a bad day. It is very moody like that.
build {
  sources = [
      "source.proxmox-iso.windows-11"
  ]

  provisioner "powershell" {
      inline = ["dir c:/"]
  }

  provisioner "windows-restart" {
  }

  provisioner "windows-update" {
    search_criteria = "IsInstalled=0"
    filters = [
      "exclude:$_.Title -like '*Preview*'",
      "include:$true",
    ]
    update_limit = 25
  }

}