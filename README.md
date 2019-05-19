### 基本环境
virtualbox下创建一个虚拟机，使用桥接网络,Ubuntu-Server 18.04 LTS,名为k8s-master,再clone一个名为k8s-node01

### 网络注意事项
1. 在执行kubeadm init时需要将网卡enp0s3(即是NAT的那个网卡)关闭
	`sudo ifconfig enp0s3 down`
   初始化成功后再将该网卡启动
	`sudo ifconfig enp0s3 up`
   *暂时不知有什么影响*
2. 关闭swap
	`sudo swapoff -a`
3. 关闭防火墙
	`sudo ufw disable`

### 部署步骤
 _主要参考视频[]()进行操作，经过整合成文件中的*.sh脚本,其主要用于部署基本环境，具体搭建方式请看视频_
1. `k8s_env.sh`会对docker和kubernetes工具进行环境准备，默认使用root为权限密码，可以在第一个传参位置输入自己的密码
	`bash k8s_env.sh [your_password]`
	准备好环境后会询问是否拉取必要的docker镜像，调用`docker_operations.sh`实现
2. `docker_operations.sh`和`k8s_env.sh`一样可以在第一传参位置输入自己的密码修改，默认是`root`
	`bash docker_operations.sh [your_password]`
3. 在参考视频进行部署kubernetes时请注意先完成“网络注意事项的内容”
