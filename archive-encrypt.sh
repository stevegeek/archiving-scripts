#!/bin/bash

set -a
source .config
set +a

# Archive and encrypt the target directory to given location
IFS=',' read -r -a array <<< "$BACKUP_TARGETS"

mkdir -p "$BACKUPS_ARCHIVE_LOCATION"

# TODO parallelise

for index in "${!array[@]}"
do
    IN="${array[index]}"
    OUT=`basename ${IN}`
    OUTPUT="$BACKUPS_ARCHIVE_LOCATION/$OUT-$index.tar.gz"
    echo "input: $IN, output $OUTPUT"
    # create tar then encrypt it
    /usr/bin/tar -czv "$IN" | /usr/bin/openssl aes-256-cbc -salt -pass env:BACKUPS_ARCHIVE_PASSWORD -out "$OUTPUT"
done
