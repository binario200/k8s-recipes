 # view history changes for a daemonset
 kubectl rollout history ds <daemonset-name>

 # see the details | settings by revision number
 kubectl rollout history ds <daemonset-name> --revision=<number>

 # changing deameonset back to an earlier version
 kubectl rollout undo ds <deameonset-name> --to-revision=<number>

 # editing and generating detailed revision history
 kubectl edit ds <daemonset-name> --record

 # view the rollout status and history
 kubectl rollout status ds <daemonset-name>

 kubectl rollout history ds <daemonset-name> --revision=<number>
 