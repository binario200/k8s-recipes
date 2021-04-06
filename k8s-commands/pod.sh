# See the pod logs
kubectl logs <pod-name>


# generate a pod from a template
kubectl run --generator=run-pod/v1 --image=<image-name> 