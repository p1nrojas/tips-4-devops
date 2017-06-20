#How to test match into arrays in jinja2 templates

The following playbook is an example to filter matching a certain pattern:

'''
- hosts: localhost
  connection: local
  vars:
    my_list: ['hello', 'apple', 'rare', 'trim', "apropos", 'three']
    my_pattern: 'a[rp].*'
  tasks:
    - set_fact:
        matches: "{%- set tmp = [] -%}
                  {%- for elem in my_list | map('match', my_pattern) | list -%}
                    {%- if elem -%}
                      {{ tmp.append(my_list[loop.index - 1]) }}
                    {%- endif -%}
                  {%- endfor -%}
                  {{ tmp }}"
    - debug:
        var: matches
      failed_when: "(matches | length) < 1"
'''

Will bring the following result:

'''
[dev@e0302f0fcd8a ~]$ ansible-playbook match-example.yml
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
        "apple",
        "apropos"
    ]
}

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0

'''
