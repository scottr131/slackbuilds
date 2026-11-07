# ====== Configurable Defaults ======
OUTPUT      ?= /tmp/packages
PKGTYPE     ?= txz
BLDTHREADS  ?= $(shell nproc)

# ====== Manually Specified Targets ======
TARGETS     := \
	usbredir spice-protocol spice numactl qemu \
	libosinfo osinfo-db-tools libvirt libvirt-glib \
	libvirt_python spice-gtk gtk-vnc \
	jq rdma-core bcrypt-subint cryptography-subint \
	libnbd googletest oath-toolkit lttng-ust babeltrace \
	thrift incus go linstor-server python_linstor \
	linstor_client drbd drbd-utils zfs openvswitch \
	protobuf-c zabbix zabbix-agent cliff bash-completion \
	libiscsi pyo3-subint benchmark snappy-rtti boost \
	ceph swtpm libtpms rabbitmq-c librdkafka libyang3 \
	ovn raft cowsql skopeo temurin-jdk11 ansible \
	glances rundeck temurin-jdk17 temurin-jdk21 \
	temurin-jdk25 buildah vcs_versioning \
	thin-provisioning-tools opentofu ipxe \
	incus-ui-canonical garage prometheus \
	asciinema virtiofsd lighthttpd vtm libpathrs \
	containerd cri-tools cni-plugins runc \
	kubernetes nerdctl fresh bat btop glow libwebsockets \
	libtelnet ufw xrdp xorgxrdp frr libyang4 etcd \
	open-isns open-iscsi truenas_incus_ctl vm-curator \
	cloud-init lazygit beszel-agent moosefs restic iperf \
	llama.cpp go-md2man conmon netavark podman \
	thin-send-recv llama.cpp-prerelease apache-tomcat9 \
	tigervnc virt-viewer libyang guacamole-server fio

INSTALLS     := $(foreach tgt,$(TARGETS),$(eval $(tgt)-install: $(pkg)))

XZTARGETS      := \
	virt-manager


BZ2TARGETS     := \
	libblkio

# ====== Phony Targets ======
.PHONY: all clean $(TARGETS) $(BZ2TARGETS) $(XZTARGETS) \
	$(INSTALLS) \
	cloud-init lang-stack lang-stack-p1 storage-stack \
	storage-stack-p1 incus-stack incus-stack-p1 \
	incus-stack-p2 qemu-stack qemu-stack-p1 \
	kubernetes-stack guacamole-stack podman-stack \
	ovn-stack xrdp-stack podman-stack

# Default: build everything
all: $(TARGETS)

# Build rule for each target
$(TARGETS):
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./$@.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); EXPECTED="$${PRGNAM}-$${VERSION}.tar.gz"; \
	if [ ! -f "$$EXPECTED" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		if [ "$$FILE" != "$$EXPECTED" ]; then \
    		    echo "==> Renaming $$FILE to $$EXPECTED"; \
		    mv "$$FILE" "$$EXPECTED"; \
		fi; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo JAVA_HOME="$(JAVA_HOME)" PATH="$(PATH)" OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild "$(EXTRA_ARGS)"

$(BZ2TARGETS):
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./$@.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); EXPECTED="$${PRGNAM}-$${VERSION}.tar.bz2"; \
	if [ ! -f "$$EXPECTED" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		if [ "$$FILE" != "$$EXPECTED" ]; then \
    		    echo "==> Renaming $$FILE to $$EXPECTED"; \
		    mv "$$FILE" "$$EXPECTED"; \
		fi; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo JAVA_HOME="$(JAVA_HOME)" PATH="$(PATH)" OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild "$(EXTRA_ARGS)"

$(XZTARGETS):
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./$@.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); EXPECTED="$${PRGNAM}-$${VERSION}.tar.xz"; \
	if [ ! -f "$$EXPECTED" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		if [ "$$FILE" != "$$EXPECTED" ]; then \
    		    echo "==> Renaming $$FILE to $$EXPECTED"; \
		    mv "$$FILE" "$$EXPECTED"; \
		fi; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo JAVA_HOME="$(JAVA_HOME)" PATH="$(PATH)" OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild "$(EXTRA_ARGS)"

lang-stack: lang-stack-p1
	@echo "Installing go, temurin-jdk21"
	@set -e; \
	sudo installpkg "$$OUTPUT/go-*.txz"; \
	sudo installpkg "$$OUTPUT/temurin-jdk21*.txz"

lang-stack-p1: temurin-jdk17 temurin-jdk21 temurin-jdk25 go

utils-stack: asciinema bash-completion bat fresh iperf restic fio

mgmt-stack: ansible glances opentofu ipxe

storage-stack: linstor-server storage-stack-p1 linstor_client drbd drbd-utils zfs

storage-stack-p1: python_linstor
	@echo "Installing python_linstor"
	@set -e; \
	sudo installpkg "$$OUTPUT/python_linstor-*.txz"


ovn-stack: openvswitch ovn

incus-stack: incus-stack-p1 cowsql incus-stack-p2 incus incus-ui-canonical skopeo virt-viewer

incus-stack-p1: raft
	@echo "Installing raft"
	@set -e; \
	sudo installpkg "$$OUTPUT/raft-*.txz"

incus-stack-p2: cowsql
	@echo "Installing cowsql"
	@set -e; \
	sudo installpkg "$$OUTPUT/cowsql-*.txz"

qemu-stack: qemu-stack-p1 qemu

qemu-stack-p1: libblkio libiscsi numactl 
	@echo "Installing libblkio, libiscsi, numactl"
	@set -e; \
	sudo installpkg "$$OUTPUT/libblkio-*.txz"; \
	sudo installpkg "$$OUTPUT/libiscsi-*.txz"; \
	sudo installpkg "$$OUTPUT/numactl-*.txz"

podman-stack: libpathrs-install runc go-md2man-install conmon netavark podman buildah skopeo

kubernetes-stack: containerd cri-tools cni-plugins libpathrs-install runc kubernetes nerdctl

libvirt-stack: spice-gtk-install gtk-vnc-install libosinfo-install osinfo-db-tools libvirt-install libvirt-glib-install libvirt_python-install virt-manager

guacamole-stack: apache-tomcat9 libtelnet-install libwebsockets-install guacamole-server

xrdp-stack: xrdp-install xorgxrdp

%-install: %
	@echo "Installing package $*"
	@set -e; \
	sudo installpkg "$$OUTPUT/$*-*.txz"
