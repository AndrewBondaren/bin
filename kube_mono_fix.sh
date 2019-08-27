KUBECONFIG=/home/abondarenko/minikube/bondarenko/config
kubectl get ingress -o=custom-columns=HOSTS:.status.loadBalancer.ingress[0].ip,ADDRESS:{.spec.rules[0].host} --no-headers=true > /tmp/hosts.kube
kubectl cp /tmp/hosts.kube $(kubectl get pods | grep monolith | awk '{print $1}'):/tmp/hosts.kube -c php
kubectl exec -it $(kubectl get pods | grep monolith | awk '{print $1}') -c php -- bash -c "cat /tmp/hosts.kube >> /etc/hosts"

