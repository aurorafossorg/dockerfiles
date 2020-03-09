#!/usr/bin/env bash

set -e;

function prepare_blobs() {
	local filename="$(basename $2)"
	(cd "$1";
		if [ ! -f "$filename" ]; then
			echo "--> Downloading $filename..."
			curl -LSs "$2" -O
		else
			echo "--> Skip already downloaded file: $filename"
		fi
	)
}

prepare_blobs multi-arch/archlinux/aarch64 http://os.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz
prepare_blobs multi-arch/archlinux/armv5 http://os.archlinuxarm.org/os/ArchLinuxARM-armv5-latest.tar.gz
prepare_blobs multi-arch/archlinux/armv7 http://os.archlinuxarm.org/os/ArchLinuxARM-armv7-latest.tar.gz
