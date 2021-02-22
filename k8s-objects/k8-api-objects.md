# Kubernetes API Objects

## Nodes
- Represents a machinne (physical or virtual) that is part of the kubernetes cluster
## Namespaces
- Used to reference both kernel features and segregation of API Objects by kubernetes
- some namespaces: default, kube-system
## Deployment
- It is a controller which manages the state of ReplicaSets and the pods within
- Will manage replicasets 
## ReplicaSet
- This controller will  ensure you have certain number of pods running
- Will create or terminate pods until the number of running pods matches the specification
- Orchestrate individual pod lifecycle and updates
- Supports label selectors
- Modifying pod's lables related with the replicaset that belongs, will insolate the pod and the RS will create a new one. 

## DaemonSets
- Ensures that a single pod of the same type run on every node in the cluster
- Update strategy.type:
  - rollingUpdate       : allows manual termination of some pods, resulting in an update image when they are recreated
  - onDelete            : upgrade a container when the predecesor is deleted
## Pods
- A group of containers (with some associated data volumes)
- One IP address per pod
- All containers share the same network namespace    
- Containers in a pod will have an interface like eth0@tunl0.
- All nodes can communicate with each other across nodes

## Volumes
- A k8s volume shares the pod lifetime, not the container within.
- A volume is a directory, possible pre-populated, available to containers in a pod.
- Pod specification can declare one or more volumes
- Access Mode
  - ReadWriteOnce : Allows read-write by a single node
  - ReadOnlyMany  : allows read-only by multiple nodes
  - ReadWriteMany : Allows read-write by many nodes
- Types:
  - local
    - emptyDir:
      - Is an empty directory that gets erases when the pod dies but is recreated when containers restarts
      - kubelet will create the directory in the container but not mount any storage
      - Data writen to shared container space. No persistent storage
      - When container is destroyed directory is deleted
    - hostPath
      - mount a resource from the host node filesystem: directory, file socket, character, block device
      - DirectoryOrCreate
      - FileOrCreate
  - Network base:
    - GCE
    - AWS
    - ...

##  Persistent Volumes
- Empty or prepopulated volumes to be claimed by a pod using  persistent volume claim. 
- Cycle: 
  - Ingesting the storage
  - binding storage to a pod
  - recycle the storage

### Persistent storage phase
  - Provision
    - Persistent volumes can be created in advance or requested from a dynamic source (cloud provider )
  - Bind
    - There is a persistent volume claim (storage, access, storage classes). A control loop wathcer bind the Persistent volume claim (pvc) with a persistent volume (pv)
  - Usage
    - The bound volume is mounted for the pod to use. Continue as long as the pod required
  - Release
    - When the pod is donde using the pv and a API request it, its sent to delete the pvc. The data remains depending on the persistent volume reclaim policy
  - Reclaim 
    - Retain: Keeps the data instact
    - Delete: Tells volume plugin to delete the API object as well as the storage behind it

## Persistent Volumes claims
- Before pods take advantage of the new persistent volume, we need to create a persistent volume claim. Defining its access mode, resource's specifications.
- A pod references a persistent volumen claim referencing the pvc's metadata.name at the pod's claimName property. 
 
## Labels 
 - Part of object's metadata. 
 - Can be used to select an object, based on an arbitrary string
 - Can be defined at: pod templates, deployment specification, on the fly. 
## Jobs
- Part of batch API group
- They are used to run a number of pods to completion
- If a pod fails it will restart until the completion number is reached
- Key properties of a job definition:  completions, parallelism, activeDeadLine

## CronJob
  
## Service Account
- Provides an indentifier for processes running in a pod to access the API server and perform actions that it is authorized to do

## Service
- Gets traffic from the outside world to a pod, or from one pod to another
- Can be also used to point to a service in a different namespace or even a resource outside the cluster, such as a legacy application not yet in the k8s  
## ClusterIP
- Interfal-facing IP address
- Use for access, throubheshooting, maintenance operations

## nodePort
- Statis IP address accessible to the outside world
- It's a service that connects the pod with outside network
- Contains endpoints. IP address + port
  
## LoadBalancer
- Exposes service externally (nodePort and ClusterIP are created) using cloud provider

## ExternalName
- Maps service to contents of externalName using a CNAME record.

## Endpoint
- Represets the set of IPs for pods that match a particular service

## LimitRange
- Use a LimitRange in order to specify resource limits (cpu, memory, disk) for an entire namespace
- New pods will inherit namespace's LimitRange resource limits
- Deployment resource specifications will override the LimitRange resource limits

## Resource Quota
- Limits the total resources (storage, cpu) consuption as well as the number of persistent volume claims
- Allows you to define quotas per namespace
- i.e number of pods for a namespace

## Secrets
- Using secret API password resources can be conded or encrypted
- Secrets are base 64 enconded
- To encrypt:
  - Create a encriptionConfiguration with a key and proper identity
  - kube-api server needs the --encryption-provider-config set for a provider
- Secrets can be used as environment variables (spec.containers[*].image.env[*].name.valueFrom.secretKeyRef: name and key)
- Secrets can be mounted as file using a volume definition in a pod manifest (spec.containers[*].image.volumeMounts.name references spec.containers[*].volumes[*].name using the secret.secreteName property to reference the secret to use)
  
## ConfigMap
- Sto data as sets of key-value pairs or plain configuration files
- not encoded
- can be used as:
  - pod environment variables (use the env's valueFrom.ConfigMapKeyRef.name/key to reference an configMap's property)
  - pod commands
  - to populate a volume (use the volume's configMap.name to reference the configMap at the pod definition)
- Ways a configMap can ingest data:
  - From a literal value
  - From a file
  - From a directory of files