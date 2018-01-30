#Some useful commands to check and fix stat server in Nuage

Check status of server and indexes
```
curl localhost:9200/_cat/indices?pretty
curl localhost:9200/nuage_flow-2018-01-29/_search?pretty | more
curl -XGET -u admin:password 'http://localhost:9200/_license'
```

Delete index
```
curl -XDELETE localhost:9200/nuage_flow-2018-01-29/_search?pretty
```

Check hostname status and setting static hostname
```
hostnamectl set-hostname "stat.nuage521.lab"
hostnamectl status
systemctl restart systemd-hostnamed
```

Restart services
```
systemctl status nginx
systemctl status elasticsearch
```
