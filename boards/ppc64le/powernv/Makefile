# Copyright (C) 2023 Wu Zhangjin <falcon@ruma.tech>
_BASE   := 1
ARCH    := powerpc
XARCH   := ppc64le
MEM     ?= 1024M

LINUX   ?= v6.4

# no buildroot support for arm/virt currently, use nolibc initrd by default
NOLIBC  := $(or $(NOLIBC),1)

NOLIBC_CFLAGS := -m64 -mlittle-endian -Wl,-EL,-melf64lppc -mno-multiple -mno-vsx -mabi=elfv2
NOLIBC_LDFLAGS := -EL -melf64lppc

SERIAL  ?= hvc0

ROOTDEV_LIST := /dev/ram0
ROOTDEV ?= /dev/ram0

ORIIMG  ?= arch/$(ARCH)/boot/zImage
KIMAGE  ?= $(BSP_KERNEL)/$(LINUX)/zImage

CCORI   ?= internal
