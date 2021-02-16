# get replica sets at the default namespace
kubectl get rs

# describe a replica set
kubectl describe rs <replica-set-name>

# Deleting the replicaset but not the pods
kubectl delete rs <replicaset-name> --cascade=false