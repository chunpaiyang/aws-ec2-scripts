#!/bin/sh

# http://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 4.4.5
node -e "console.log('Running Node.js ' + process.version)"


yum install gcc-c++ -y
yum install nodejs npm --enablerepo=epel
curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
yum remove -y nodejs npm
yum install -y nodejs

./NPM_INIT.sh
