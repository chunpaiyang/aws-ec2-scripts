#!/bin/sh
. path.sh

ec2_pem_path=${EC2_PEM_PATH}
ec2_instance=${EC2_INSTANCE}

scp -i ${ec2_pem_path} ${1}  ${ec2_instance}:~/.
