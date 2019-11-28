#!/bin/bash

# IP を変数に格納
ipv4_cidrs=$(curl https://api.cis.cloud.ibm.com/v1/ips | jq -r .result.ipv4_cidrs)

# 長さを変数に格納
lenv4=$(echo $ipv4_cidrs | jq length)
array=()

for i in $( seq 0 $(($lenv4 - 1)) ); do
  row=$(echo $ipv4_cidrs | jq -r .[$i])
  array+=( $i)
  array+=( $row )
done

{
    echo '['
    printf '{"%s": "%s"},\n' "${array[@]}" | sed '$s/,$//'
    echo ']'
} | jq '. | add'
