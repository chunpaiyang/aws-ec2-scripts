#!/bin/sh

# AWS linux: (uname) 4.9.38-16.35.amzn1.x86_64 #1 SMP Sat Aug 5 01:39:35 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux

# https://github.com/rbenv/rbenv
install_rbenv()
{
	git clone https://github.com/rbenv/rbenv.git ~/.rbenv
	cd ~/.rbenv && src/configure && make -C src

	# googled miss this step may cause problem
	git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
	~/.rbenv/bin/rbenv init
	source ~/.bashrc_profile

}

install_node()
{
	local version=$1
	# http://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
	. ~/.nvm/nvm.sh
	nvm install ${version}
}

yum update

# install rbenv
install_rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

# upgrade ruby
version="2.4.2"
yum install -y readline-devel
rbenv install

# install latest node
version="4.4.5"
install_node ${version}
node -e "console.log('Running Node.js ' + process.version)"

# install others: gcc-c++, nodejs, git
yum install gcc-c++ -y
yum install nodejs npm --enablerepo=epel
curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
yum remove -y nodejs npm
yum install -y nodejs
yum install -y git

./NPM_INIT.sh
