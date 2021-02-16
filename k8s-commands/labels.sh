# using labels to select objects
kubectl get pods -l <label-name>=<label=value>

# Listing labels as values
kubectl get pods -L <label-name>

# defining a label in a pod
kubectl label pods <pod-name> <label-name>=<label-value>

# displaying the object's labels
kubectl get pods --show-labels