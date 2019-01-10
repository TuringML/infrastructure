#!/bin/bash

kubectl delete pv $(kubectl get pv | awk 'NR>1{if ($5 == "Released") print$1}')

# TODO: removing volumes from EC2
# for volume in `aws ec2 describe-volumes --output text | grep available | awk '{print $8}'`
#   do
#     aws ec2 delete-volume --volume-id="$volume"
# done
