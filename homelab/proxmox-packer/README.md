# Ubuntu Packer Builder for Proxmox

## Building an Image

You will first want to determine if your host running Packer can be accessed by the Proxmox host. This is because Packer will briefly run an http server so that the installer can download the kickstart file. If Proxmox is on the same network as your builder host and there are no other firewall restrictions on your builder host this should work fine. If not, you will need to copy/host the ks.cfg files on a publicly accessible server.

Next, you will need to know the URL to your Proxmox system, the name of the node to build on as well as a username and password of a user with sufficient privileges to create VMs and templates. If you have customized your install or are using a storage pool other than the default you will need to specify that as well.

With all of the information at hand, edit the variables.pkrvars.hcl file and update the variables. For a full set of variables you can override look at any packer.pkr.hcl file for a list of variables.

In addition to using the packer.pkr.hcl file you can also set some variables using environment variables. For example, I set my Proxmox password using the following variable:

```
PROXMOX_PASSWORD=<scrubbed>
```

### Using the Makefile

You can build the following templates by running:

* make ubuntu2404

### Building manually

If you do not want to use the Makefile then the following commands will work:

#### Ubuntu 24.04

```
packer build -var-file variables.pkrvars.hcl ubuntu2404/packer.pkr.hcl
```

* `proxmox_username` - username to log into Proxmox as
* `proxmox_password` - password to log into Proxmox as
* `proxmox_url` - URL of your Proxmox system
* `proxmox_node` - name of the Proxmox node to build on
* `proxmox_storage_pool` - name of the storage pool the image should be built on
* `proxmox_storage_pool_type` - type of storage pool, `lvm-thin` (default), `lvm` , `zfspool` or `directory`
* `proxmox_storage_format` - storage format, `raw` (default), `cow`, `qcow`, `qed`, `qcow2`, `vmdk` or `cloop` 
* `ubuntu_image` - The OS image.
* `template_name` - Name of the template. Defaults to `CentOS7-Template` or `CentOS8-Template` depending on version
* `template_description` - Template description. Defaults to `CentOS 7 Template` or `CentOS 8 Template` depending on image being built.

## After the image is built

Once the image is built you will want to adjust any remaining settings in the template including creating a cloud-init drive. A cloud-init drive _must_ be created for you to ssh into any new VMs you create. For details on how to do so visit [https://blog.dustinrue.com/proxmox-cloud-init/](https://blog.dustinrue.com/proxmox-cloud-init/).