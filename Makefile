# ====== Configurable Defaults ======
OUTPUT      ?= /tmp/packages
PKGTYPE     ?= txz
BLDTHREADS  ?= $(shell nproc)

# ====== Manually Specified Targets ======
TARGETS     := \
	usbredir spice-protocol spice numactl qemu \
	libosinfo osinfo-db-tools libvirt libvirt-glib \
	libvirt-python virt-manager spice-gtk gtk-vnc \
	jq rdma-core bcrypt-subint cryptography-subint \
	libnbd googletest oath-toolkit lttng-ust babeltrace \
	thrift incus go linstor-server python_linstor \
	linstor_client drbd drbd-utils zfs openvswitch \
	protobuf-c zabbix zabbix-agent cliff bash-completion \
	libiscsi pyo3-subint benchmark snappy-rtti boost \
	ceph swtpm libtpms rabbitmq-c librdkafka libyang \
	ovn raft cowsql skopeo temurin-jdk11 ansible \
	glances rundeck temurin-jdk17 temurin-jdk21 \
	thin-provisioning-tools opentofu \
	incus-ui-canonical garage prometheus \
	asciinema virtiofsd lighthttpd vtm \
	containerd cri-tools cni-plugins runc \
	kubernetes nerdctl fresh bat btop

BZ2TARGETS     := \
	libblkio

# ====== Phony Targets ======
.PHONY: all clean $(TARGETS) $(BZ2TARGETS) \
	cloud-init

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
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

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
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

