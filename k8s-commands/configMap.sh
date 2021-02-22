# Creating configMaps
kubectl create configMap <name> 
    --from-literal=<text>
    # --from-file=<file-path>

# managing configMaps
kubect get configMap <name>