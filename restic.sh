#!/bin/bash

set -a # export all variables created next
source .config
set +a # stop exporting

if [ $1 = "upload" ]; then
  # Push contents of archive directory to S3 with restic
  echo "Use Restic to upload archive to $S3_BUCKET_NAME ..."
  restic -r s3:s3.amazonaws.com/$S3_BUCKET_NAME backup $BACKUPS_ARCHIVE_LOCATION
elif [ $1 = "check" ]; then
  echo "Use Restic check command... on $S3_BUCKET_NAME"
  restic -r s3:s3.amazonaws.com/$S3_BUCKET_NAME check
elif [ $1 = "setup" ]; then
  echo "Use Restic to init a repo in $S3_BUCKET_NAME ..."
  restic -r s3:s3.amazonaws.com/$S3_BUCKET_NAME init
else
  echo "Please specify a command..."
  exit 1
fi
