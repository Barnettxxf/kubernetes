sudo apt install software-properties-common -y
wget -O- https://download.gluster.org/pub/gluster/glusterfs/3.12/rsa.pub | sudo apt-key add -
sudo add-apt-repository ppa:gluster/glusterfs-3.12
sudo apt install glusterfs-server -y
