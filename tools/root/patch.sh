#!/bin/bash
#
# rootfs/patch.sh -- Apply the available rootfs patchs
#
# Copyright (C) 2016-2021 Wu Zhangjin <falcon@ruma.tech>
#

BOARD=$1
BUILDROOT=$2
ROOT_SRC=$3
ROOT_OUTPUT=$4

TOP_DIR=$(cd $(dirname $0)/../../ && pwd)
TOP_SRC=${TOP_DIR}/src

RPD_BOARD=${TOP_DIR}/boards/${BOARD}/patch/buildroot/${BUILDROOT}/

RPD_BSP=${TOP_DIR}/boards/${BOARD}/bsp/patch/buildroot/${BUILDROOT}/

RPD=${TOP_SRC}/patch/buildroot/${BUILDROOT}/

for d in $RPD_BOARD $RPD_BSP $RPD
do
    echo $d
    [ ! -d $d ] && continue

    for p in `find $d -type f -name "*.patch" | sort`
    do
        # Ignore some buggy patch via renaming it with suffix .ignore
        echo $p | grep -q .ignore$
        [ $? -eq 0 ] && continue

        echo $p | grep -q \.ignore/
        [ $? -eq 0 ] && continue

        if [ -f "$p" ]; then
            grep -iq "GIT binary patch" $p
            if [ $? -eq 0 ]; then
                pushd ${ROOT_SRC} >/dev/null && git apply -p1 < "$p" && popd >/dev/null
            else
                patch -r- -N -l -d ${ROOT_SRC} -p1 < "$p"
            fi
        fi
    done

    if [ -x "$d/patch.sh" ]; then
        $d/patch.sh $ROOT_SRC
    fi
done
