# Turn down all bridges
```
for i in `brctl show | awk '{ print $1 }' | grep -vE 'bridge'`; do ifdown $i; done
```
