# How to to massively test thru iperf3 for ACLs

on the server:
```
mkdir iperf
cd iperf
for i in $(seq 1000 1100); do `iperf3 -s -p $i > listen$i.out 2>&1 &` ; done
```

On the client:
```
mkdir iperf
cd iperf
for i in $(seq 1000 1100); do `iperf3 -c 172.16.1.63 -p $i > client$i.out 2>&1 &` ; done
```
