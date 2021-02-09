# Upgrading Kubernetes components in master and nodes
This is the general process. 

- At master node
  - Remove the hold on kubeadm
    - ``` sudo apt-mark unhold kubeadm ```
  - Install the new version of kubeadm
    - ``` sudo apt-get install -y kubeadm=1.19.0-00 ```  
  - Mark the hold for new the new kubeadm version
    - ``` sudo apt-mark hold kubeadm ```
  - Verify kubeadm new version
    - ``` sudo kubeadm version ``` 
  - Evict pods from master node
    - ``` kubectl drain master --ignore-daemonsets ```
  - Plan the upgrade
    - ``` sudo kubeadm upgrade plan ```
  - Apply the upgrade
    - ``` sudo kubeadm upgrade apply v1.19.0 ```
  - Check the staus and version of the nodes
    - ``` kubectl get nodes ```
  - Release the hold on kubectl and kubelet versions
    - ``` sudo apt-mark unhold kubelet kubectl ```  
  - Upgrade kubelet and kubectl to the same kubeadm version
    - ``` sudo apt-get install -y kubelet=1.19.0-00 kubectl=1.19.0-00 ``` 
  - hold the new kubectl and kubelet versions
    - ``` sudo apt-mark hold kubelet kubectl ```
  - restore daemons
    - ``` sudo systemctl daemon-reload &&  sudo systemctl restart kubelet  ```
  - Verify updates
    - ```  kubectl get nodes ```
  - Make the master node available again for the scheduller
    - ``` kubectl uncordon master ```

## Prepare nodes to be upgraded
Before upgrade controle plane components in a cluster node, evict node pods, one node at the time before to upgrade the component's versions. 

``` kubectl drain <worker-name> --ignore-dameonsets ```

After applying the upgrades to the node's contronl plane components, go back to MASTER node and make the worker node avaiable to the scheduller

``` kubectl uncordon <workder-name> ``` 

## Upgrading woker nodes control plane componentes
- At woker node 
  - Remove the hold on kubeadm
    - ``` sudo apt-mark unhold kubeadm ```
  - Install the new version of kubeadm
    - ``` sudo apt-get update && sudo apt-get install -y kubeadm=1.19.0-00 ```  
  - Mark the hold for new the new kubeadm version
    - ``` sudo apt-mark hold kubeadm ```
  - Verify kubeadm new version
    - ``` sudo kubeadm version ``` 
  - Download the updated node configuration
    - ``` sudo kubeadm upgrade node ```
  - Release the hold on kubectl and kubelet versions
    - ``` sudo apt-mark unhold kubelet kubectl ```  
  - Upgrade kubelet and kubectl to the same kubeadm version
    - ``` sudo apt-get install -y kubelet=1.19.0-00 kubectl=1.19.0-00 ``` 
  - hold the new kubectl and kubelet versions
    - ``` sudo apt-mark hold kubelet kubectl ```
  - restore daemons
    - ``` sudo systemctl daemon-reload &&  sudo systemctl restart kubelet  ```
