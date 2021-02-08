# Backing up etcd database 
## General process
- Locate important etcd info
- Backup the database
  - ``` ETCDCTL_API=3 etcdctl --endpoints=$ENDPOINTS --cert=$ETCDCTL_CERT --cacert=$ETCDCTL_CACERT key=$ETCDCTL_KEY snapshot save /var/lib/etcd/<snapshot-name>.db   # container data directory``` 
- Do you maintenance operations over etcd
- Restore the database snapshot 
  - ``` ETCDCTL_API=3 etcdctl  --data-dir /var/lib/etcd-from-backup snapshot restore /opt/<snapshot-name>.db ```

## Locate important etcd info
- For a service configured K8s cluster: locate the etcd deamon data directory
- For "static pod configured k8s cluster"
  - At the etcd static pode manifest, locate the data and certifactes directories:
    - ```sudo grep data-dir /etc/kubernetes/manifests/etcd.yaml ```
  - Etcd certificates and keys usually are located at:
    - /etc/kubernetes/pki/etcd
- etcd database run in a pod and its expose its API at PORT 2379.
- Identify the etcd pod. You can execute the backing up and upgrade operations from the kubectl command or login into the etcd container:
    - Loging into the etcd container :
      - ``` kubectl -n kube-system -exec -it etcd-<control-plane-name> --sh```
      - Every operation in the etcd database required the use of certificates and keys so you can export to the location of them in the current session: 
        - ```             
            export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
            export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt # this file names could be different
            export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/key.crt  # this file names could be different     
            export ENDPOINTS=https://[127.0.0.1]:2379

            # etcd commands like
            ETCDCTL_API=3 etcdctl --endpoints=$ENDPOINTS --cert=$ETCDCTL_CERT --cacert=$ETCDCTL_CACERT key=$ETCDCTL_KEY memeber health
            ETCDCTL_API=3 etcdctl etcdctl --endpoints=$ENDPOINTS --cert=$ETCDCTL_CERT --cacert=$ETCDCTL_CACERT key=$ETCDCTL_KEY memeber list 
          ``` 
    - Executing all etcd operations from the kubectl. In this case all the times you need to provide ETCDCTL_API and ETCDCTL_certs/keys locations or exporting it to the bash session environment: 
      - ```
            kubectl -n kube-system exec -it etcd-<controle-plane-name> --ssh -c "--ETCDCTL_API=3
            --ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
            --ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt # this file names could be different
            --ETCDCTL_KEY=/etc/kubernetes/pki/etcd/key.crt  # this file names could be different     
            --endpoints=https://127.0.0.1:2379
            etcdctl endpoint health"
        ```