#!/bin/sh
. path.sh

rm -rf /opt/eff.org
pip install pip --upgrade

pip install virtualenv --upgrade

virtualenv -p /usr/bin/python27 venv27

. venv27/bin/activate

git clone https://github.com/letsencrypt/letsencrypt

cd letsencrypt

./letsencrypt-auto certonly --debug --standalone -d ${ec2_instance}
