WD=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
BUILD=$(WD)build

ML=$(MAKE) -C linux O=$(BUILD)

.PHONY: all build clean version

all: clean build

build:
	$(ML) allnoconfig
	cp kernel-config $(BUILD)/.config
	$(ML) -j8 vmlinux

version:
	$(ML) -s kernelversion

clean:
	$(ML) mrproper
