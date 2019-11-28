#!/bin/bash

# IP を変数に格納
ipv6_cidrs=$(curl https://api.cis.cloud.ibm.com/v1/ips | jq -r .result.ipv6_cidrs)

# 長さを変数に格納
len=$(echo $ipv6_cidrs | jq length)

# 空の配列を定義
array=()

# 配列に key value key value ... と格納
for i in $( seq 0 $(($len - 1)) ); do
  row=$(echo $ipv6_cidrs | jq -r .[$i])
  array+=( $i)
  array+=( $row )
done

# 格納した配列を JSON に整形して表示 { "key": "value", "key": "value", ...}
{
    echo '['
    printf '{"%s": "%s"},\n' "${array[@]}" | sed '$s/,$//'
    echo ']'
} | jq '. | add'
