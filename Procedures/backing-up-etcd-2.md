check etcd version

``` ETCDCTL_API=3 etcdctl version```

Go to etc/kubernetes/manifests to check the configuration of the etcd static pod

```
cd /etc/kubernetes/manifests/

cat etcd.yaml
```

at the etcd pod definition you can find at the .spec.containers.exec.command the location of the certificates

```
ETCDCTL_API=3 --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki healthcheck-client.crt --key=/etc/kubernetes/pki/etcd/healthcheck-client.key
```

User the location of the certifcates and the endpoints to run the etcd backup commmand:

```
## test connectivity
ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/healthcheck-client.crt --key=/etc/kubernetes/pki/etcd/healthcheck-client.key member list

ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/healthcheck-client.crt --key=/etc/kubernetes/pki/etcd/healthcheck-client.key snapshot save /opt/etcd-backup.db


# check the snapshot
ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/healthcheck-client.crt --key=/etc/kubernetes/pki/etcd/healthcheck-client.key snapshot status /opt/etcd-backup.db -w table

```

