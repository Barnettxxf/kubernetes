#!/bin/bash

password=root
if [ ! -z $1 ]
then
	password=$1
fi
sudo -S apt-get update << EOF
$password
EOF

if [ ! -e "./already" ]
then
	echo 'installing apt-transport-https ca-certificates curl software-properties-common'	
	sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
	echo 'preparing install docker.io'
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	sudo apt update
	echo 'installing docker.io'
	sudo apt-get install docker.io=17.12.1-0ubuntu1
	echo 'docker.io installed successfully'
	echo 'preparing install kubu*'
	curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -
	sudo add-apt-repository "deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main"
	sudo apt-get update
	echo 'installing kube*'
	sudo apt-get install -y kubelet kubeadm kubectl
	echo 'kube* installed successfully'
	
fi

if [ ! -e "/etc/docker" ]
then
	sudo mkdir /etc/docker
fi

echo 'add aliyuncs mirrors to docker'
sudo echo '{"registry-mirrors": ["https://mtjcu40o.mirror.aliyuncs.com"}' > /etc/docker/daemon.json

# if file `already` existed, do not execute above commands again
touch ./already

# docker operations
echo 'start docker operations(yes/no):'
read is_continue
if [ $is_continue == "yes" ]
then
	bash ./docker_operations.sh
fi

if [ -e "./already" ]
then
	rm ./already
fi

exit 0

