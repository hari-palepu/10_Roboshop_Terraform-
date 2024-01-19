#!bin/bash
yum install ansible -y
cd /tmp
git clone https://github.com/hari-palepu/10_terraform_ansible_roles.git
cd 10_terraform_ansible_roles
ansible-playbook -e host_name=mongodb main.yml
ansible-playbook -e host_name=redis main.yml
ansible-playbook -e host_name=rabbitmq main.yml
ansible-playbook -e host_name=mysql main.yml
ansible-playbook -e host_name=catalogue main.yml
ansible-playbook -e host_name=user main.yml
ansible-playbook -e host_name=cart main.yml
ansible-playbook -e host_name=shipping main.yml
ansible-playbook -e host_name=payment main.yml
ansible-playbook -e host_name=web main.yml

#The above user data/boot strapping will excute only once