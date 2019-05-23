# kubectl create -f ./deploy/1.8+/

echo 'please run: kubectl edit cm coredns -n kube-system'
echo 'and add you nodes host like this'
echo '
...
apiVersion: v1
data:
  Corefile: |
    .:53 {
        errors
        health
        hosts {
          192.168.0.104 k8s-node01 # Modify according to the actual situation
          192.168.0.103 k8s-node02 # Modify according to the actual situation
          fallthrough
        }
        kubernetes cluster.local in-addr.arpa ip6.arpa {
           pods insecure
           upstream
           fallthrough in-addr.arpa ip6.arpa
        }
        prometheus :9153
        forward . /etc/resolv.conf
        cache 30
        loop
...
'
