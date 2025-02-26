.PHONY: ubuntu2404 windows-s2022 windows-11 all

all: ubuntu2404 windows-s2022 windows-11

ubuntu2404:
	packer init ubuntu2404/
	packer build -var-file variables.pkrvars.hcl -var-file ubuntu-24.04.pkrvars.hcl ubuntu2404/

windows-s2022:
	packer init windows-s2022/
	packer build -var-file variables.pkrvars.hcl -var-file windows-s2022.pkrvars.hcl windows-s2022/

windows-11:
	packer init windows-11/
	packer build -var-file variables.pkrvars.hcl -var-file windows-11.pkrvars.hcl windows-11/