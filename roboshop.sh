#!/bin/bash
aws ec2 run-instances \
    --image-id ami-0055977a6e828a4f4 \
    --instance-type t2.micro \
    --security-group-ids sg-0574b9e33f7cce2ef \
    --query 'Instances[0].PrivateIpAddress' \
    --output text