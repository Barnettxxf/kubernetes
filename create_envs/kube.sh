#!/bin/bash

HOSTNAME=`hostname`

password=root
if [ ! -z $1 ]
then
	password=$1
fi

sudo -S swapoff -a << EOF
$password
EOF

MASTER_IP=192.168.56.104


# master 
sudo kubeadm init --kubernetes-version=1.14.1 --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$(hostname -I | awk '{print $1}')
# node01

kubeadm join 192.168.56.104:6443 --token h625jz.dy7lomy3ntsxtgbd --discovery-token-ca-cert-hash sha256:2deece2bf85523f5602a609d30799324b5594392c41f840b2b165981e42f9820

sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.11.0/Documentation/kube-flannel.yml


sudo wget https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml
