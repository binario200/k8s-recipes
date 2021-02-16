# kubectl auth allows you options to check user permissions

# check if the current user is able to create a specific api object
# kubectl auth can-i create <api-object>
kubectl auth can-i create deployments

# asking for another user and specific namespace
kubectl auth can-i create deployments --as <user-name> --namespace <namespace>