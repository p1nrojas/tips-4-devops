#!/bin/bash
unset HTTP_PROXY
unset HTTPS_PROXY
cd /home/dev/vspk-ansible
ansible-playbook -e enterprise_name=OS_Nuage -e nuage_domain=ebd2bff0-828a-46a1-aace-0bda9d7e58a3 -e my_pattern='ma-tdmrsq' -e nuage_pgroup=tcp80_liberado -e nuage_state=present itau_vm_list.yml
