#!/bin/bash

INITRAMFS_OUTPUT="/boot/initramfs-linux.img"
INITRAMFS_CMD="dracut -f -H --kmoddir $(dirname ${f}) $INITRAMFS_OUTPUT"

_detect_kver() {
    local kver_validator='^[[:digit:]]+(\.[[:digit:]]+)+'
    offset=$(hexdump -s 526 -n 2 -e '"%0d"' "$1" 2>/dev/null) || return 1
    read kver _ < \
        <(dd if="$1" bs=1 count=127 skip=$(( offset + 0x200 )) 2>/dev/null)
    [[ $kver =~ $kver_validator ]] && printf "$kver"
}

while read f; do
        echo $f
        if [[ ${f} == *"vmlinuz" ]]; then
                echo "kernel found"
                cp /${f} /boot/vmlinuz-linux
                version=$(_detect_kver ${f})
                echo "version is $version"
                mv -b $INITRAMFS_OUTPUT $INITRAMFS_OUTPUT.old
                $INITRAMFS_CMD $version
        fi
done

