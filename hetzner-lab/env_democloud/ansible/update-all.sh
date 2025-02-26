ansible-galaxy install -v -r requirements.yml -p ./roles/
ansible-playbook -i inventory update-all.yml