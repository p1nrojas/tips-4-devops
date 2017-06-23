# Extract the files

```
# Usage:./extract_nuage_files.sh [folder] [release: i.e 40r9 ]
extract_nuage_files.sh . 40r9
```

# Upload Files

```
s3cmd put * "s3://nuage-demo-cala/40r9 files/"
```

# Configure s3cmd

```
s3cmd --configure
#Path to GPG program: /usr/bin/gpg
```
# Make public recursively

```
s3cmd setacl -r 's3://nuage-demo-cala/40r9 files/' --acl-public
```
