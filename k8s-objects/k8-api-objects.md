# Kubernetes API Objects

## Nodes
- Represents a machinne (physical or virtual) that is part of the kubernetes cluster
## Namespaces
- Used to reference both kernel features and segregation of API Objects by kubernetes
- some namespaces: default, kube-system
## Deployment
- It is a controller which manages the state of ReplicaSets and the pods within 
## ReplicaSet
- Orchestrate individual pod lifecycle and updates

## DaemonSets
- Ensures taht a single pod of the same type run on every node in the cluster
## Pods
- A group of containers (with some associated data volumes)
- One IP address per pod
- All containers share the same network namespace    
- Containers in a pod will have an interface like eth0@tunl0.
- All nodes can communicate with each other across nodes

## Jobs
- Part of batch API group
- They are used to run a number of pods to completion
- If a pod fails it will restart until the completion number is reached
- Key properties of a job definition:  completions, parallelism, activeDeadLine

## CronJob


  
## Service Account
- Provides an indentifier for processes running in a pod to access the API server and perform actions that it is authorized to do
## nodePort
- It's a service that connects the pod with outside network
- Contains endpoints. IP address + port

## Endpoint
- Represets the set of IPs for pods taht match a particular service

## LimitRange
- Use a LimitRange in order to specify resource limits (cpu, memoriy, disk) for an entire namespace
- New pods will inherit namespace's LimitRange resource limits
- Deployment resource specifications will override the LimitRange resource limits

## Resource Quota
- Allows you to define quotas per namespace
- i.eL number of pods for a namespace

## Secrets