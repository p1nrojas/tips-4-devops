# Criar as regras no security template especifico

```
ansible-playbook -e nuage_state=absent itau-fw-regras.yml 
```

# Link/Unlink VMs dos policy groups

```
ansible-playbook -e enterprise_name=OpenStack_default -e nuage_domain=912473ef-1801-491a-8939-15455229368a -e nuage_pgroup=cuarentena -e vport_id=78405514-9003-49b3-b180-ce2a9b89703e itau-pgroups.yml
```
