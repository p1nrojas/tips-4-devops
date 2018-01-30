ansible-playbook -e enterprise_name=OS_Nuage -e nuage_domain=49bdd9b5-9710-4bb2-8bee-cb4a56475b9f -e nuage_pgroup=vspk-quarentena -e vport_id=0013f429-b771-443b-a1e6-4b04426df732 itau_pgroup_link.yml

ansible-playbook -e enterprise_name=OS_Nuage -e nuage_domain=49bdd9b5-9710-4bb2-8bee-cb4a56475b9f -e nuage_pgroup=vspk-quarentena -e vport_id=0013f429-b771-443b-a1e6-4b04426df732 itau_pgroup_unlink.yml

ansible-playbook -e enterprise_name=OS_Nuage -e nuage_domain=49bdd9b5-9710-4bb2-8bee-cb4a56475b9f -e my_pattern='vspk-pg02' -e nuage_pgroup=vspk-quarentena -e nuage_state=present itau_vm_list.yml

ansible-playbook -e enterprise_name=OS_Nuage -e nuage_domain=49bdd9b5-9710-4bb2-8bee-cb4a56475b9f -e my_pattern='vspk-pg02' -e nuage_pgroup=vspk-quarentena -e nuage_state=absent itau_vm_list.yml
