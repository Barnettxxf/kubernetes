helm init --service-account tiller --upgrade -i registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:v2.14.0  --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
kubectl get deploy --namespace kube-system   tiller-deploy  --output yaml|grep  serviceAccount
kubectl -n kube-system get pods|grep tiller
# 先移除原先的仓库
helm repo remove stable
# 添加新的仓库地址
helm repo add stable https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
helm repo add bitnami https://charts.bitnami.com/bitnami
# 更新仓库
helm repo update


