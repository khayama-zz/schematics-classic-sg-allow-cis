#!/bin/bash
read ARGS
IBMCLOUD_API_KEY=`echo "$ARGS" | jq -r '."IBMCLOUD_API_KEY"'`
WORKSPACE_ID=`echo "$ARGS" | jq -r '."WORKSPACE_ID"'`
ibmcloud login -a cloud.ibm.com --apikey $IBMCLOUD_API_KEY
ibmcloud terraform apply  --force --json --id $WORKSPACE_ID
