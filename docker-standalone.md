# Install Nuage Docker StandAlone

```
docker run -p 8400:8400 -p 8500:8500 -p 8600:53/udp -h node1 progrium/consul -server -bootstrap
mkdir /etc/systemd/system/docker.service.d/
[root@node1:~]# cat /etc/systemd/system/docker.service.d/docker.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -D --cluster-store=consul://<consul server IP>:8500 --cluster-advertise=<node1 IP>:2376
[root@node1:~]# cat /usr/lib/systemd/system/docker.socket
[Unit]
Description=Docker Socket for the API
PartOf=docker.service
[Socket]
ListenStream=/var/run/docker.sock
SocketMode=0660
SocketUser=root
SocketGroup=docker

[Install]
WantedBy=sockets.target
service docker restart



[root@node1:~]# yum localinstall -y nuage-libnetwork-<version>-1.x86_64.rpm


[root@node1:~]# cat /etc/default/nuage-libnetwork.yaml
vrssocketfile:    "/var/run/openvswitch/db.sock"
dockersocketfile: "unix:///var/run/docker.sock"
vrsbridge:      "alubr0"
loglevel:       "Debug"
logfilesize:    10
scope:          "global"
numofretries:   5
timeinterval:   100
username: Y3Nwcm9vdA==
password: Y3Nwcm9vdA==
organization: Y3Nw
url: https://<VSD URL>:8443
systemctl start nuage-libnetwork
```
