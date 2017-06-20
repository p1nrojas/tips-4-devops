# Check Subtring in elements in an array in Jinja2

```
- hosts: localhost
  connection: local
  vars:
    my_list: ['hello', 'apple', 'rare', 'trim', "apropos", 'three']
    substr: 'l'
  tasks:
    - set_fact:
        matches: "{%- set tmp = [] -%}
                  {%- for elem in my_list  -%}
                    {%- if substr in elem -%}
                      {{ tmp.append(my_list[loop.index - 1]) }}
                    {%- endif -%}
                  {%- endfor -%}
                  {{ tmp }}"
    - debug:
        var: matches
      failed_when: "(matches | length) < 1"
```

The result:

```
[dev@e0302f0fcd8a ~]$ ansible-playbook string-condit.yml
 [WARNING]: provided hosts list is empty, only localhost is available


PLAY [localhost] ***************************************************************

TASK [setup] *******************************************************************
ok: [localhost]

TASK [set_fact] ****************************************************************
ok: [localhost]

TASK [debug] *******************************************************************
ok: [localhost] => {
    "failed": false,
    "failed_when_result": false,
    "matches": [
        "hello",
        "apple"
    ]
}

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0
```
