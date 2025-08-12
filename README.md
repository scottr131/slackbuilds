ckbuild files for various programs on Slackware.  These should produce a functional package, but are far from production ready.

#### Qemu Stack 
- usbredir
- spice-protocol
- spice (`spice-protocol` must be installed prior to build)
- libblkio
- libiscsi
- numactl
- qemu (all packages above must be prior to build)
- libtpms
- swtpm (`libtpms` must be installed prior to build)

#### Libvirt / virt-manager Stack
- spice-gtk
- gtk-vnc
- libosinfo
- osinfo-db-tools (`libosinfo` must be installed prior to build)
- libvirt
- libvirt-glib (`libvirt` must be installed prior to build)
- libvirt-python (`libvirt` must be installed prior to build)
- virt-manager (all packages above must be installed prior to build)

#### Incus Stack
- raft
- cowsql (`raft` must be installed prior to build)
- incus (all packages above must be installed prior to build)
- skopeo

#### Linstor
- linstor-server
- linstor_client
- drbd
- drbd-utils
- thin-provisioning-tools

#### OpenZFS Stack
- zfs

#### Open Virtual Network (OVN) / Open vSwitch (OVS) Stack
- openvswitch
- protobuf
- libyang
- ovn
		
#### XRDP Stack
- xrdp
- xordxrdp

