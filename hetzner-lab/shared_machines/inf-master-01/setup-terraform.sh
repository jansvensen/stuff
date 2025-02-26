# Install Terraform
curl -O https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip
sudo unzip terraform_1.1.7_linux_amd64.zip -d /usr/bin/ && rm -rf terraform_1.1.7_linux_amd64.zip
terraform version