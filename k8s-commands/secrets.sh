# Managing secrets in kubernetes

kubectl get secrets

# to get secrets in all namespaces
kubectl get secrets --all-namespaces

kubectl describe secret <secret-name>

# creating an encoded secret (default)
# to more options use kubectl create secret generic --help
kubectl create secret generic <secret-name> --from-literal=<key>=<value>
