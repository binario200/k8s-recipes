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

### Another components
- Container Network Internet (CNI)
  - Provide container networking. Configure the cluster network