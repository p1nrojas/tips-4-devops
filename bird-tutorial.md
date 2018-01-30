## Installing bird
```
sudo yum install epel-release
yum install -y bird bird6
```

## Configuring bird
Set /etc/bird.conf to something like this:
```
filter packetdns {
# IPs to announce (the elastic ip in our case)
if net = 10.254.0.0/24 then accept;
}
# your (Private) bond0 IP below here
router id 10.88.163.1;
protocol direct {
#interface "core-gateway"; # Restrict network interfaces it works with
}
protocol kernel {
# learn; # Learn all alien routes from the kernel
persist; # Don't remove routes on bird shutdown
scan time 20; # Scan kernel routing table every 20 seconds
import all; # Default is import all
export all; # Default is export none
# kernel table 5; # Kernel table to synchronize with (default: main)
}
# This pseudo-protocol watches all interface up/down events.
protocol device {
scan time 10; # Scan interfaces every 10 seconds
}
# your default gateway IP below here
protocol bgp {
export filter packetdns;
local as 65000;
neighbor 10.88.163.0 as 65530;
#password "md5password";
}
```

## Testing bird
You can execute 'birdc' and try the following:
```
bird> show protocols
name     proto    table    state  since       info
kernel1  Kernel   master   up     01:04:27
device1  Device   master   up     01:04:27
bgp1     BGP      master   up     01:05:01    Established
direct1  Direct   master   up     01:04:27
bird>configure
bird>reset all
bird>show protocols all bgp1
bird>show route
```
