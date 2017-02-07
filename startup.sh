#!/bin/bash

# This will extract all tarballs in /mnt, presumably you will only
# restore one, but this prevents you from needing to supply the name.
find /mnt -name '*.tar.gz' | while read FN; do
    tar -xzvf "${FN}" -C /var/lib/mysql
done

/usr/bin/mysqld_safe
