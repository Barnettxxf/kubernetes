sudo kubeadm init --kubernetes-version=1.14.1 --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$(hostname -I | awk '{print $1}')
