# jun/13/2026 13:23:17 by RouterOS 7.8
# software id = 
#
/interface bridge
add comment=->Core name=V-Switch vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] comment=Capus disable-running-check=no name=\
    ether1-LAN
set [ find default-name=ether2 ] disable-running-check=no name=ether2-LAN
set [ find default-name=ether3 ] disable-running-check=no name=ether3-LAN
set [ find default-name=ether4 ] disable-running-check=no name=ether4-LAN
set [ find default-name=ether5 ] disable-running-check=no name=ether5-LAN
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
set [ find default-name=ether9 ] disable-running-check=no
set [ find default-name=ether10 ] disable-running-check=no
set [ find default-name=ether11 ] disable-running-check=no
set [ find default-name=ether12 ] disable-running-check=no
set [ find default-name=ether13 ] disable-running-check=no
set [ find default-name=ether14 ] disable-running-check=no
set [ find default-name=ether15 ] disable-running-check=no
set [ find default-name=ether16 ] disable-running-check=no
set [ find default-name=ether17 ] disable-running-check=no
set [ find default-name=ether18 ] disable-running-check=no
set [ find default-name=ether19 ] disable-running-check=no
set [ find default-name=ether20 ] disable-running-check=no
set [ find default-name=ether21 ] disable-running-check=no
set [ find default-name=ether22 ] disable-running-check=no
set [ find default-name=ether23 ] comment=Trunk->Core disable-running-check=\
    no mtu=1504 name=ether23-Trunk
set [ find default-name=ether24 ] comment=Trunk->Core disable-running-check=\
    no mtu=1504 name=ether24-Trunk
set [ find default-name=ether25 ] disable-running-check=no
set [ find default-name=ether26 ] disable-running-check=no
set [ find default-name=ether27 ] disable-running-check=no
set [ find default-name=ether28 ] disable-running-check=no
/interface vlan
add comment=Vlan100 interface=V-Switch name=vlanmgt vlan-id=100
/interface bonding
add comment=Trunk->Core mode=802.3ad name=Trunk-Core slaves=\
    ether23-Trunk,ether24-Trunk
/disk
set slot1 slot=slot1
set slot2 slot=slot2
set slot3 slot=slot3
set slot4 slot=slot4
set slot5 slot=slot5
set slot6 slot=slot6
set slot7 slot=slot7
set slot8 slot=slot8
set slot9 slot=slot9
set slot10 slot=slot10
set slot11 slot=slot11
set slot12 slot=slot12
set slot13 slot=slot13
set slot14 slot=slot14
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/port
set 0 name=serial0
/interface bridge port
add bridge=V-Switch interface=vlanmgt pvid=100
add bridge=V-Switch interface=Trunk-Core
add bridge=V-Switch comment=Campus interface=ether1-LAN pvid=60
add bridge=V-Switch interface=ether2-LAN pvid=60
add bridge=V-Switch interface=ether3-LAN pvid=60
add bridge=V-Switch interface=ether4-LAN pvid=60
add bridge=V-Switch interface=ether5-LAN pvid=60
/interface bridge vlan
add bridge=V-Switch comment=Vlanmgt tagged=V-Switch,Trunk-Core untagged=\
    vlanmgt vlan-ids=100
add bridge=V-Switch comment=Campus tagged=V-Switch,Trunk-Core untagged=\
    ether1-LAN,ether2-LAN,ether3-LAN,ether4-LAN,ether5-LAN vlan-ids=60
/ip address
add address=192.168.100.4/28 interface=vlanmgt network=192.168.100.0
/ip dhcp-client
# DHCP client can not run on slave or passthrough interface!
add interface=ether1-LAN
/ip route
add disabled=no dst-address=0.0.0.0/0 gateway=192.168.100.2 routing-table=\
    main suppress-hw-offload=no
/system identity
set name=Campus-Switch
/tool romon
set enabled=yes
