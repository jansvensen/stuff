git pull
ansible-galaxy install -v -r requirements.yml -p ./roles/
ansible-playbook -i inventory create-env-some.yml