# Kubernetes API Objects

## Pods
- A group of containers (with some associated data volumes)
- One IP address per pod
- All containers share the same network namespace    
- Containers in a pod will have an interface like eth0@tunl0.
- All nodes can communicate with each other across nodes
  

## nodePort
- It's a service that connects the pod with outside network
- Contains endpoints. IP address + port

## LimitRange
- Use a LimitRange in order to specify resource limits (cpu, memoriy, disk) for an entire namespace
- New pods will inherit namespace's LimitRange resource limits
- Deployment resource specifications will override the LimitRange resource limits