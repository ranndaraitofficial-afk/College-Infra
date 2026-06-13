# jun/13/2026 13:16:15 by RouterOS 7.8
# software id = 
#
/interface bridge
add name=V-Swtich vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] comment=Bonding disable-running-check=no \
    mtu=1504 name=ether1-Trunk
set [ find default-name=ether2 ] comment=Bonding disable-running-check=no \
    mtu=1504 name=ether2-Trunk
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
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
set [ find default-name=ether21 ] comment=Core->Campus disable-running-check=\
    no mtu=1504 name=ether21-Campus
set [ find default-name=ether22 ] comment=Core-.Campus disable-running-check=\
    no mtu=1504 name=ether22-Campus
set [ find default-name=ether23 ] comment=Core->Staff disable-running-check=\
    no mtu=1504 name=ether23-Staff
set [ find default-name=ether24 ] comment=Core->Staff disable-running-check=\
    no mtu=1504 name=ether24-Staff
set [ find default-name=ether25 ] disable-running-check=no
set [ find default-name=ether26 ] disable-running-check=no
set [ find default-name=ether27 ] disable-running-check=no
set [ find default-name=ether28 ] disable-running-check=no
/interface vlan
add comment=Vlanmgt interface=V-Swtich name=vlan100 vlan-id=100
/interface bonding
add comment=Core->Campus mode=802.3ad mtu=1504 name=Trunk-Campus slaves=\
    ether22-Campus,ether21-Campus
add comment="To Pfsense" mode=802.3ad name=Trunk-Pfsense slaves=\
    ether1-Trunk,ether2-Trunk
add comment=Core->Staff mode=802.3ad name=Trunk-Staff slaves=\
    ether24-Staff,ether23-Staff
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
set slot15 slot=slot15
set slot16 slot=slot16
set slot17 slot=slot17
set slot18 slot=slot18
set slot19 slot=slot19
set slot20 slot=slot20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/port
set 0 name=serial0
/interface bridge port
add bridge=V-Swtich comment=Core->Campus interface=Trunk-Campus
add bridge=V-Swtich comment=Core->Staff interface=Trunk-Staff
add bridge=V-Swtich interface=vlan100 pvid=100
add bridge=V-Swtich comment="-> Pfsense" interface=Trunk-Pfsense
/interface bridge vlan
add bridge=V-Swtich comment=IT tagged=V-Swtich,Trunk-Pfsense,Trunk-Staff \
    vlan-ids=10
add bridge=V-Swtich comment=Vlanmgt tagged=\
    V-Swtich,Trunk-Pfsense,Trunk-Staff,Trunk-Campus untagged=vlan100 \
    vlan-ids=100
add bridge=V-Swtich comment=Admin tagged=V-Swtich,Trunk-Pfsense,Trunk-Staff \
    vlan-ids=20
add bridge=V-Swtich comment=Lectuere tagged=\
    V-Swtich,Trunk-Pfsense,Trunk-Staff vlan-ids=30
add bridge=V-Swtich comment=Exam tagged=V-Swtich,Trunk-Pfsense,Trunk-Staff \
    vlan-ids=40
add bridge=V-Swtich comment=Counter tagged=V-Swtich,Trunk-Pfsense,Trunk-Staff \
    vlan-ids=50
add bridge=V-Swtich comment=Campus tagged=V-Swtich,Trunk-Pfsense,Trunk-Campus \
    vlan-ids=60
/ip address
add address=192.168.100.2/28 interface=vlan100 network=192.168.100.0
/ip dhcp-client
# DHCP client can not run on slave or passthrough interface!
add interface=ether1-Trunk
/ip route
add comment="To The Internet" disabled=no distance=1 dst-address=0.0.0.0/0 \
    gateway=192.168.100.1 pref-src="" routing-table=main scope=30 \
    suppress-hw-offload=no target-scope=10
/system identity
set name=Core-Switch
/tool romon
set enabled=yes
