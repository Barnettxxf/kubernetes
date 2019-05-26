sudo systemctl restart glusterd.service 
sudo systemctl restart glustereventsd.service
sudo mkdir -p /glusterfs/distributed
sudo gluster volume create v01 replica 2 transport tcp gfs01:/glusterfs/distributed gfs02:/glusterfs/distributed force
