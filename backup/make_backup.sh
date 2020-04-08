#!/bin/sh

if [ -n "$EXCLUDE" ]; then
    dirs=$( \
    	echo "${EXCLUDE}" | \
		tr " " "\n" |  \
		awk -F' ' '{print "/src/"$0}' | \
		tr "\n" " " \
    )
    exclude_opt="-e ${dirs}"
else
    exclude_opt=""
fi

echo running:
echo mksquashfs \
    /src \
    "/dest/$(date +%F).sfs" \
    -comp gzip \
    -xattrs \
    -progress \
    -mem 512M \
    ${exclude_opt}

mksquashfs \
    /src \
    "/dest/$(date +%F).sfs" \
    -comp gzip \
    -xattrs \
    -progress \
    -mem 512M \
    ${exclude_opt}
