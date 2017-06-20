## Nuage OpenVSwitch commands for Kubernetes

Command to show all ports:
'''
ovs-appctl container/port-show
'''

Command ro remove undesired vports
'''
ovs-appctl vm/send-event undefine afd67b33d1808570bb9c85db38e7291dd1ae2d6b9e8a50e6aaf9f24b5c385f26 container docker
'''

Command from VSC
'''
show vswitch-controller containers detail
'''

Remove iptables rules form nodes
'''
iptables -L --line-numbers
iptables -D INPUT 7
iptables -D FORWARD 4
iptables -D FORWARD 3
'''

From the master
'''
iptables -L --line-numbers
iptables -D INPUT 9
iptables -D FORWARD 1
'''

Edit for debug level for VSP Plugin at Kubernetes
Edit file at follow: /usr/share/vsp-k8s/vsp-k8s.yaml
'''
# allowed options are: "dbg", "info", "warn", "err", "emer", "off"
logLevel: dbg
'''

Change: /etc/systemd/system/kubelet.service.d/10-kubeadm.conf at nodes
'''
Environment="KUBELET_DNS_ARGS=--cluster-dns=10.96.0.10 --cluster-domain=cluster.local"
restart kubelet and check using "service kubelet status -l"
'''

