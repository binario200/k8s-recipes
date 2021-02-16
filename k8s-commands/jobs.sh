# managing jobs

kubectl create job -f <job-definition.yaml>

kubectl get job <job-name>

kubectl describe jobs.batch <job-name>

kubectl delete jobs.batch <job-name>