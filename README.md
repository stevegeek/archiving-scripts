Simple archiving scripts
========================

Archives & encrypts files first locally using 'trusted' OS bundled `openssl`. The
archives are then backed up to `S3` (eg using `restic`, but could be rsync etc).

Of course backup software like `restic` will actually encrypt again locally before
uploading but one could argue that the extra paranoia is needed to not put the
safety of your files in the hands of an application installed from the web,
which you cannot easily audit. It seems possible that say the `brew` install
script is compromised, and for a time the installed version of your backup
software is actually proxying all your data though a middleman.
