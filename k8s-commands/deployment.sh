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
# if replica is set to zero, there would be not containers but there would be a replica set and deployment
kubectl scale deployment <deployment-name> --replicas=<number-of-replicas>

# Deployment rollbacks
# The --record option of kubectl create command allows ANNOTATIONS the resource definition and creates REVISIONS
kubectl create deployment <deployment-name> image=<image-name> --record

kubectl set image deployment/<deployment-name> image-name=<image-name:new-version> --record
## kubectl set image deployment/nginx-deployment nginx=nginx:1.16.1 --record

## one way to set annotation (another is automatically using the --record or editing the annotations at the deployment)
kubectl annotate deployment <deployment-name> kubernetes.io/change-cause="image updated to 1.16.1"

# checking the rollout history 
kubectl rollout hisotry deployment <deployment-name> 

# reviewing specificy revision
kubectl rollout history deployment <deployment-name> --revision=2

# Rolling back to a previous deployment version
kubectl rollout undo deployment <deployment-name>

# Rolling backt to specific revision
kubectl rollout undo deployment <deployment-name> --to-revision=2






