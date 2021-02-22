# Kubernetes Components

### Control plane
Responsible for ensuring the current state matches the desired state

- kubeadm 
  - Build the cluster
- kube-apiserver H
  - andle all call (external or internal). It's the only connection to the etcd database
- kube-scheduler
  - Determine which node will host a pod of container. Deploy the pods
- etcd
  - Keeps the state of the cluster, networking and another persistent information
- kube-controller-manager
  - Helps the kube-apiserver to determine the state of the cluster
  - Contact to the controllers to match the desire state
- kubectl 
  - Makes API call on you behalf
- kubelet
  - Its a daemon that checks the pod specifiction by asking the container engine for the current status. 
- kube-proxy
  - Agent that watches the kubernetes API for new services and endpoints being created on each node 
  - It opens random ports and listen for traffic to the clusterIP:port and redirectsto the randomly generated service endpoint
  - IPtables is the default proxy mode 
- CoreDNS
  - Once the container starts, coreDNS will run a server fo the zones it has been configured to server. 
  - Then each server can load one or more plugin chaing to provide other functionality. 
  
### Another components
- Container Network Internet (CNI)
  - Provide container networking. Configure the cluster network