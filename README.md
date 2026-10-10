## Scott's SlackBuilds

These are slackbuild files for various programs on Slackware.  These should produce a functional package, but are far from production ready.  I've tried to group packages into related stacks and denote dependencies. 

#### Management Tools Stack
- ansible
- glances
- opentofu

#### Utilities Stack
- asciinema
- bash-completion
- bat
- fresh

#### Developement Stack
- temurin-jdk21

#### Kubernetes Stack
- containerd
- cri-tools
- cni-plugins
- runc
- kubernetes
- nerdctl

#### Qemu Stack 
- usbredir (depricated from stack, now included with Slackware-current)
- spice-protocol (depricated from stack, now included with Slackware-current)
- spice (depricated from stack, now included with Slackware-current, `spice-protocol` must be installed prior to build)
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
- incus-ui-canonical

#### Storage Stack
- linstor-server
- python_linstor
- linstor_client
- drbd
- drbd-utils
- thin-provisioning-tools (depricated from stack, now included with Slackware-current)
- zfs

#### Open Virtual Network (OVN) / Open vSwitch (OVS) Stack
- openvswitch
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


