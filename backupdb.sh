#!/bin/bash

openstack server start backup

sleep 30

ssh backup 'sudo mount /dev/vdb /backups'

ssh db1 'rm -rf /home/ubuntu/backup/*'
ssh db1 'rm -rf /home/ubuntu/zipped_file/*'


ssh db1 'python3 /home/ubuntu/bookface/tools/backup_db.py --output-dir /home/ubuntu/backup'

ssh db1 'tar czf /home/ubuntu/zipped_file/bfdata_backup.tgz /home/ubuntu/backup'

ssh db1 'scp /home/ubuntu/zipped_file/bfdata_backup.tgz backup:/home/ubuntu/'
ssh Backup 'sudo mv /home/ubuntu/bfdata_backup.tgz /backups/'

sleep 10

openstack server stop backup
