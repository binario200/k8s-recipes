# gets the nodes in the cluster
kubectl get nodes 

# describe an object use the basic for of
#  kubectl [-namespace <namespace>] describe <api-object> <object-name>
kubectl describe node node01 

# Also you can specify the detail version and use a specific format
# kubectl [-namespace <namespace>] describe <api-object> <object-name>  -o wide -o yaml 
kubectl describe node node01 -o yaml 



