#!/bin/bash
sudo apt-get update
sudo apt-get install ansible git nano -y
git clone https://github.com/andreipak/wordpress-ansible.git
cd wordpess-ansible
sudo ansible-playbook playbook.yml -i hosts -e mysql_root_password=#password#