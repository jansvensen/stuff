proxmox_storage_pool = 

.PHONY: ubuntu2204 ubuntu2404 all

all: ubuntu2004 ubuntu2204

ubuntu2204:
	packer init ubuntu2204/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl ubuntu2204/packer.pkr.hcl

ubuntu2404:
	packer init ubuntu2404/packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl ubuntu2404/packer.pkr.hcl