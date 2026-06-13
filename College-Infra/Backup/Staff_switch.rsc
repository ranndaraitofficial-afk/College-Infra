# jun/13/2026 13:22:29 by RouterOS 7.8
# software id = 
#
/interface bridge
add name=V-Switch vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] comment=Staff->Core disable-running-check=no \
    mtu=1504 name=ether1-Core
set [ find default-name=ether2 ] comment=Staff-Core disable-running-check=no \
    mtu=1504 name=ether2-Core
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
set [ find default-name=ether20 ] comment=Counter disable-running-check=no \
    name=ether20-LAN
set [ find default-name=ether21 ] comment=Exam disable-running-check=no name=\
    ether21-LAN
set [ find default-name=ether22 ] comment=Lectuere disable-running-check=no \
    name=ether22-LAN
set [ find default-name=ether23 ] comment=Admin disable-running-check=no \
    name=ether23-LAN
set [ find default-name=ether24 ] comment=IT disable-running-check=no name=\
    ether24-LAN
set [ find default-name=ether25 ] disable-running-check=no
set [ find default-name=ether26 ] disable-running-check=no
set [ find default-name=ether27 ] disable-running-check=no
set [ find default-name=ether28 ] disable-running-check=no
/interface vlan
add comment=mgt interface=V-Switch name=vlan100 vlan-id=100
/interface bonding
add comment=Staff->Core mode=802.3ad name=Trunk-Core slaves=\
    ether1-Core,ether2-Core
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
set slot21 slot=slot21
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/port
set 0 name=serial0
/interface bridge port
add bridge=V-Switch comment=Staff->Core interface=Trunk-Core
add bridge=V-Switch comment=Vlanmgt interface=vlan100 pvid=100
add bridge=V-Switch comment=IT interface=ether24-LAN pvid=10
add bridge=V-Switch comment=Admin interface=ether23-LAN pvid=20
add bridge=V-Switch comment=Lecturer interface=ether22-LAN pvid=30
add bridge=V-Switch comment=Exam interface=ether21-LAN pvid=40
add bridge=V-Switch comment=Counter interface=ether20-LAN pvid=50
/interface bridge vlan
add bridge=V-Switch comment=IT tagged=V-Switch,Trunk-Core untagged=\
    ether24-LAN vlan-ids=10
add bridge=V-Switch comment=Vlanmgt tagged=V-Switch,Trunk-Core untagged=\
    vlan100 vlan-ids=100
add bridge=V-Switch comment=Admin tagged=V-Switch,Trunk-Core untagged=\
    ether23-LAN vlan-ids=20
add bridge=V-Switch comment=Lectuere tagged=V-Switch,Trunk-Core untagged=\
    ether22-LAN vlan-ids=30
add bridge=V-Switch comment=Exam tagged=V-Switch,Trunk-Core untagged=\
    ether21-LAN vlan-ids=40
add bridge=V-Switch comment=Counter tagged=V-Switch,Trunk-Core untagged=\
    ether20-LAN vlan-ids=50
/ip address
add address=192.168.100.3/28 comment=Vlanmgt interface=vlan100 network=\
    192.168.100.0
/ip dhcp-client
# DHCP client can not run on slave or passthrough interface!
add interface=ether1-Core
/ip route
add disabled=no dst-address=0.0.0.0/0 gateway=192.168.100.2 routing-table=\
    main suppress-hw-offload=no
/system identity
set name=Staff-Switch
/tool romon
set enabled=yes
