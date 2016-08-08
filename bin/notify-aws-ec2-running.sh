#!/usr/bin/env bash

while true; do
    date
    INSTANCES=$(/Users/alex/.python_virtualenvs/ansible_aws_279/bin/aws ec2 describe-instances --filters Name=instance-state-name,Values=running | grep InstanceId)
    if [[ -n "$INSTANCES" ]]; then
        echo "$INSTANCES"
        osascript -e 'display notification "instances running" with title "aws ec2"'
    fi
    sleep $(( 60 * 45 ))
done

