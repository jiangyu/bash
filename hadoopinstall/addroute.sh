#!/bin/bash
/sbin/route add -net 10.220.16.0/24 gw 10.39.0.1
/sbin/route add -net 10.73.21.0/24 gw 10.39.0.1
/sbin/route add -net 10.73.20.0/24 gw 10.39.0.1
/sbin/route add -net 10.218.0.0/16 gw 10.39.0.1
sed -i '$a\/sbin/route add -net 10.220.16.0/24 gw 10.39.0.1' /etc/rc.local
sed -i '$a\/sbin/route add -net 10.73.21.0/24 gw 10.39.0.1' /etc/rc.local
sed -i '$a\/sbin/route add -net 10.73.20.0/24 gw 10.39.0.1' /etc/rc.local
sed -i '$a\/sbin/route add -net 10.218.0.0/16 gw 10.39.0.1' /etc/rc.local
