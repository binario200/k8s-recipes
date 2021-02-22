# create a deployment for a image
kubectl create deployment <name> --image <image-name>

# creates a service and generates a random port in all cluster nodes
kubectl expose deployment <deployment-name>