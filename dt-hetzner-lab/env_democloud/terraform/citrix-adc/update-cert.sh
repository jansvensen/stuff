terraform apply --auto-approve -target="module.adc-06-letsencrypt-lb" && 
sudo terraform apply --auto-approve -target="module.adc-07-letsencrypt" && 
terraform destroy --auto-approve -target="module.adc-06-letsencrypt-lb"