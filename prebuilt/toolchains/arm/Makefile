# Makefile

CCORI ?= bootlin
CCORI_LIST ?= internal bootlin arm

# FIXME: Uboot hang on versatilepb with linaro toolchain
ifneq ($(filter $(MACH), versatilepb), $(MACH))
  CCORI_LIST += linaro
endif

TOOLCHAIN  ?= $(PREBUILT_TOOLCHAINS)/$(XARCH)

ifeq ($(CCORI), internal)
  CCPRE   ?= arm-linux-gnueabi-
  CCPATH  ?= $(dir $(shell which $(CCPRE)gcc))
endif

ifeq ($(CCORI), bootlin)
  CCVER   ?= 2018.11-1
  CCPRE   ?= $(XARCH)-linux-
  CCBASE  := armv7-eabihf--uclibc--stable-$(CCVER)
  CCPATH  ?= $(TOOLCHAIN)/$(CCBASE)/bin
  CCURL   := https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/$(CCBASE).tar.bz2
endif

ifeq ($(CCORI), linaro)
  CCVER   ?= 7.4.1-2019.02
  CCPRE   ?= $(XARCH)-linux-gnueabi-
  CCBASE  := gcc-linaro-$(CCVER)-x86_64_$(XARCH)-linux-gnueabi
  CCPATH  ?= $(TOOLCHAIN)/$(CCBASE)/bin

  empty   :=
  space   := $(empty) $(empty)
  tmp     := $(subst -,$(space),$(CCVER))
  _CCVER  := $(basename $(firstword $(tmp)))-$(lastword $(tmp))
  
  CCURL   := https://releases.linaro.org/components/toolchain/binaries/$(_CCVER)/$(XARCH)-linux-gnueabi/$(CCBASE).tar.xz
endif

ifeq ($(CCORI), arm)
  CCVER   ?= 8.3-2019.03
  CCPRE   ?= $(XARCH)-linux-gnueabi-
  CCBASE  := gcc-arm-$(CCVER)-x86_64-$(XARCH)-linux-gnueabi
  CCPATH  ?= $(TOOLCHAIN)/$(CCBASE)/bin
  CCURL   := https://developer.arm.com/-/media/Files/downloads/gnu-a/$(CCVER)/binrel/$(CCBASE).tar.xz
endif
