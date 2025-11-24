# ====== Configurable Defaults ======
OUTPUT      ?= /tmp/packages
PKGTYPE     ?= txz
BLDTHREADS  ?= $(shell nproc)

# ====== Manually Specified Targets ======
TARGETS     := \
	usbredir spice-protocol spice libblkio numactl qemu \
	libosinfo osinfo-db-tools libvirt libvirt-glib \
	libvirt-python virt-manager spice-gtk gtk-vnc \
	jq rdma-core bcrypt-subint cryptography-subint \
	libnbd googletest oath-toolkit lttng-ust babeltrace \
	thrift incus go linstor-server python_linstor \
	linstor_client drbd drbd-utils zfs openvswitch \
	protobuf-c zabbix zabbix-agent cliff bash-completion

# ====== Phony Targets ======
.PHONY: all clean $(TARGETS) \
	libiscsi pyo3-subint swtpm libtpms boost rabbitmq-c \
	librdkafka raft cowsql skopeo thin-provisioning-tools \
	benchmark snappy-rtti jdk21 libyang ovn cloud-init

# Default: build everything
all: $(TARGETS)

# Build rule for each target
$(TARGETS):
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

cloud-init:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv 25.3.tar.gz cloud-init-25.3.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild
jdk:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv OpenJDK17U-jdk_x64_linux_hotspot_17.0.16_8.tar.gz jdk-17.0.16+8.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild
jdk21:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv OpenJDK21U-jdk_x64_linux_hotspot_21.0.8_9.tar.gz jdk-21.0.8+9.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild
ovn:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v25.03.1.tar.gz ovn-25.03.1.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild
libyang:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v3.13.5.tar.gz libyang-3.13.5.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild
thin-provisioning-tools:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v1.2.1.tar.gz thin-provisioning-tools-1.2.1.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild
skopeo:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v1.20.0.tar.gz skopeo-1.20.0.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

cowsql:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v1.15.9.tar.gz cowsql-1.15.9.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

raft:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v0.22.1.tar.gz raft-0.22.1.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

rabbitmq-c:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v0.15.0.tar.gz rabbitmq-c-0.15.0.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

librdkafka:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v2.11.1.tar.gz librdkafka-2.11.1.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild
boost:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv boost_1_89_0.tar.bz2 boost-1.89.0.tar.bz2; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

snappy-rtti:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv 1.2.2.tar.gz snappy-1.2.2.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

benchmark:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v1.9.4.tar.gz benchmark-1.9.4.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

pyo3-subint:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f "$$FILE" ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v0.26.0.tar.gz pyo3-0.26.0.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

libiscsi:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f libiscsi-1.20.3.tar.gz ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv 1.20.3.tar.gz libiscsi-1.20.3.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

libtpms:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f libiscsi-1.20.3.tar.gz ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v0.10.1.tar.gz libtpms-0.10.1.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

swtpm:
	@echo "==> Building $@"
	@set -e; \
	cd $@; \
	. ./template.info; \
	FILE=$$(basename "$${DOWNLOAD_x86_64}"); \
	if [ ! -f libiscsi-1.20.3.tar.gz ]; then \
  		echo "==> Downloading $$FILE from $${DOWNLOAD_x86_64}"; \
  		curl -L -o "$$FILE" "$${DOWNLOAD_x86_64}"; \
		mv v0.10.1.tar.gz swtpm-0.10.1.tar.gz; \
	else \
  		echo "==> Source archive already exists: $$FILE"; \
	fi; \
	chmod +x ./$@.Slackbuild; \
	sudo OUTPUT="$(OUTPUT)" PKGTYPE="$(PKGTYPE)" BLDTHREADS="$(BLDTHREADS)" ./$@.Slackbuild

# Clean all downloaded tarballs and build artifacts
clean:
	@echo "==> Cleaning all build directories"
	@for dir in $(TARGETS); do \
  		rm -f $$dir/*.tar.* $$dir/*.tgz $$dir/*.txz $$dir/*.tbz $$dir/*.zip; \
  		rm -rf $$dir/package-* $$dir/*-*/; \
	done

