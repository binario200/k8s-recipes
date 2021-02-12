# see the deployment in the default namespace
kubectl get deployments

# see deployments specifying name space
kubectl -n <namespace> get deployments

# get a specific deployment
kubec -n <namespace> get deployment <deployment-n ame>

# describe a specific deployment in yaml format
kubectl  -n <namespace> get deployment <deployment-n ame> -o yaml 

# create a deployment from a file in yaml 
kubectl create -f <path-to-deployment-definition>

# deleting deployment
kubectl delete deployment <deployment-name>

# Scalling a deployment
kubectl scale deployment <deployment-name> --replicas=<number-of-replicas>