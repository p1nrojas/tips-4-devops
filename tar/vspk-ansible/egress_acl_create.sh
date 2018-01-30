#!/bin/bash
unset HTTP_PROXY
unset HTTPS_PROXY
cd /home/dev/vspk-ansible
ansible-playbook -e nuage_state=present -e acl_rules_file="cfg/$1" /home/dev/vspk-ansible/itau_egress_acl_entries.yml
