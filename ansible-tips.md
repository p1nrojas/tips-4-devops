## Some useful tips for ansible

```
ansible core -i hosts -c local -m command -a "echo {{ br_connect[0].gateway }}"
ansible core -i hosts -c local -m command -a "echo {{ hostvars[groups['bmetal'][3]].br_connect[0].gateway }}"
ansible core -i hosts -c local -m command -a "echo {{ hostvars['core'].br_connect[0].gateway }}"
```

