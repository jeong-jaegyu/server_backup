#! /bin/bash

server_name=${PWD##*/}
date_time=$(date +%d%m%Y-%H%M)
file_name="${server_name}_${date_time}"

tar -cf ${file_name}.tar $(cat important_files)
gzip -v9 ${file_name}.tar

mv ${file_name}.tar.gz /srv/backups/minecraft/${server_name}/${file_name}.tar.gz
