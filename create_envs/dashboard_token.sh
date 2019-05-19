name=`kubectl get secrets  -n kube-system | grep dashboard-admin | awk '{print $1}'`
echo $name
kubectl describe secrets $name -n kube-system
