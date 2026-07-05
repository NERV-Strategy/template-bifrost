#!/usr/bin/env bash

PORT=$1

if [[ -z "${PORT}" ]]; then
  >&2 echo "Please provide port as argument"
  exit 1
fi

sudo firewall-cmd --permanent --direct --add-rule ipv4 nat PREROUTING 0 -i bifrost-bridge -p tcp --dport "${PORT}" -j DNAT --to-destination "127.0.0.1:${PORT}"
sudo firewall-cmd --permanent --direct --add-rule ipv4 nat POSTROUTING 0 -o lo -p tcp --dport "${PORT}" -j SNAT --to-source 127.0.0.1
sudo firewall-cmd --reload