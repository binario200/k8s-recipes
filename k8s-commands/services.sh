# accessing an app with a service

kubectl expose                  # create a service and generates a random port in all cluster nodes
    deploymet/<deployment-name>
    --port=<port-number>
    --type=<port-type>          # nodePort for example
    # --targetPort              to specify the port of a pod. 


# getting endpoints
kubectl get ep <deployment-name>