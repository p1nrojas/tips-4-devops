# Segment DHCP over Layer-2 with OpenVSwitch 

The use case is the follow: A bunch of bare metal servers inter-connected thru layer-2 with OpenVSwitch.
Those have access to some services over this network. However, they should manage different DHCP settings (i.e. default gateway).
We will extend extend the bridge thru vxlan ports over all the bare metals. also, every baremetal will provide DHCP locally to its own bridge
Finally, flow rules filter DHCP packets beyong the baremetal over the same bridge.  

## Create a VXLAN between two servers to extend a bridge
Add a new VXLAN port to a brdge called "core"
```
ovs-vsctl add-port core vxlan01 -- set Interface vxlan01 type=vxlan options:remote_ip=10.88.44.131 options:key=20
```
Remove a VXLAN port from a bridge called "core"
```
ovs-vsctl del-port core vxlan01
```

# Create a internal port to connect VMs from Host
Adding internal port called sdn01-port to bridge core 
```
ovs-vsctl add-port core sdn01-port -- set Interface sdn01-port type=internal
```
You should set an address as follow (CentOS):
```
ifconfig sdn01-port 192.168.0.2/24 up
```

# Create a flow to lock DHCP traffic
```
ovs-ofctl add-flow external dl_type=0x0800,nw_proto=17,tp_dst=67,in_port=1,actions=drop
ovs-ofctl add-flow external dl_type=0x0800,nw_proto=17,tp_dst=68,in_port=1,actions=drop
```
Delete a flow
```
ovs-ofctl del-flows external dl_type=0x0800,tp_dst=67,in_port=1
```
# Identify the port
```
ovs-ofctl show external
OFPT_FEATURES_REPLY (xid=0x2): dpid:00006633e874aa47
n_tables:254, n_buffers:0
capabilities: FLOW_STATS TABLE_STATS PORT_STATS QUEUE_STATS ARP_MATCH_IP
actions: output enqueue set_vlan_vid set_vlan_pcp strip_vlan mod_dl_src mod_dl_dst mod_nw_src mod_nw_dst mod_nw_tos mod_tp_src mod_tp_dst
 1(ext-vxlan): addr:fa:03:6c:b1:51:75
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
 2(ext-gw): addr:fe:07:db:70:57:34
     config:     0
     state:      0
     speed: 0 Mbps now, 0 Mbps max
 3(vnet1): addr:fe:54:00:81:a8:93
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 4(vnet4): addr:fe:54:00:f0:3d:f5
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 5(vnet5): addr:fe:54:00:d2:5c:bd
     config:     0
     state:      0
     current:    10MB-FD COPPER
     speed: 10 Mbps now, 0 Mbps max
 LOCAL(external): addr:66:33:e8:74:aa:47
     config:     PORT_DOWN
     state:      LINK_DOWN
     speed: 0 Mbps now, 0 Mbps max
OFPT_GET_CONFIG_REPLY (xid=0x4): frags=normal miss_send_len=0
```

# DHCP Settings
DHCP settings for NSGs

```
subnet 192.168.0.0 netmask 255.255.255.0 {
 range 192.168.0.120 192.168.0.123;
 option domain-name-servers 192.168.0.2;
 option domain-name "sdn40r7.lab";
 option routers 192.168.0.2;
 option broadcast-address 192.168.0.255;
 default-lease-time 600000;
 max-lease-time 7200000;
}
```

