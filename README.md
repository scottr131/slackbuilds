## Scott's SlackBuilds

These are slackbuild files for various programs on Slackware.  These should produce a functional package, but are far from production ready.  I've tried to group packages into related stacks and denote dependencies. 

#### Management Tools Stack
- ansible
- glances
- rundeck
- opentofu

#### Utilities Stack
- asciinema
- bash-completion
- bat
- btop
- fresh
- ufw
- vtm

#### Developement Stack
- temurin-jdk11
- temurin-jdk17
- temurin-jdk21
- temurin-jdk25

#### Kubernetes Stack
- containerd
- cri-tools
- cni-plugins
- runc
- kubernetes
- nerdctl

#### Qemu Stack 
- usbredir (depricated, now included with Slackware-current)
- spice-protocol (depricated, now included with Slackware-current)
- spice (depricated, now included with Slackware-current, `spice-protocol` must be installed prior to build)
- libblkio
- libiscsi
- numactl
- qemu (all packages above must be prior to build)

#### Libvirt / virt-manager Stack
- spice-gtk
- gtk-vnc
- libosinfo
- osinfo-db-tools (`libosinfo` must be installed prior to build)
- libvirt
- libvirt-glib (`libvirt` must be installed prior to build)
- libvirt-python (`libvirt` must be installed prior to build)
- virt-manager (all packages above must be installed prior to build)
- libtpms
- swtpm (`libtpms` must be installed prior to build)

#### Incus Stack
- raft
- cowsql (`raft` must be installed prior to build)
- incus (all packages above must be installed prior to build)
- skopeo
- incus-

#### Storage Stack
- linstor-server
- python_linstor
- linstor_client
- drbd
- drbd-utils
- thin-provisioning-tools
- zfs

#### Open Virtual Network (OVN) / Open vSwitch (OVS) Stack
- openvswitch
- protobuf
- libyang
- ovn
		
#### XRDP Stack
- xrdp
- xordxrdp

#### Ceph Stack
- pyo3-subint
- bcrypt-subint
- cryptography-subint
- rdma-core
- libnbd
- googletest
- benchmark
- snappy-rtti
- oath-toolkit
- numactl
- lttng-ust
- babeltrace
- boost
- thrift
- rabbitmq-c
- librdkafka
- ceph


