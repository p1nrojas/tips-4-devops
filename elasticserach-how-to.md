# get indexes
```
[dev@1159bbef2b0c elasticsearch]$ curl -XGET 'http://10.48.224.65:9200/_cat/indices?v'
health status index                     pri rep docs.count docs.deleted store.size pri.store.size
green  open   .triggered_watches          1   0          0            0        1mb            1mb
green  open   nuage_acl-2017-09-11        2   0          5            0     26.1kb         26.1kb
green  open   nuage_acl-2017-09-13        2   0        113            0      108kb          108kb
```

# add python modules
```
pip install elasticserach
pip install requests
```
