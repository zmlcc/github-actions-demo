WD=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
BUILD=$(WD)build

.PHONY: all build clean version

all: clean build

build:
	$(MAKE) -C linux O=$(BUILD) allnoconfig
	cp kernel-config $(BUILD)/.config
	$(MAKE) -C linux O=$(BUILD) -j8 vmlinux

version:
	$(MAKE) -C linux O=$(BUILD) -s kernelversion

clean:
	$(MAKE) -C linux O=$(BUILD) mrproper
