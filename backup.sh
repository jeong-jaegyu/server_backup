#! /bin/bash

server_name=${PWD##*/}

date_time=$(date +%d%m%Y-%H%M)
file_name="${server_name}_${date_time}"

echo 'Executing backup for' ${server_name}
echo 'Current DateTime is' ${date_time}

echo "Files adding to archive:" $(cat important_files)
tar -cf ${file_name}.tar $(cat important_files)
echo "Finished tar..."

echo "GZipping..."
lzma -v9 ${file_name}.tar
echo "XZip succesful..."

echo "Moving tar to backup dir"
mv ${file_name}.tar.xz /srv/backups/minecraft/${server_name}/${file_name}.tar.gx
