#!/bin/sh
. path.sh

ec2_pem_path=${EC2_PEM_PATH}
ec2_instance=${EC2_INSTANCE}

ssh -i ${ec2_pem_path} ${ec2_instance}
