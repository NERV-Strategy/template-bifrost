#!/usr/bin/env bash

docker network create \
  --driver bridge \
  -o "com.docker.network.bridge.name"="bifrost-bridge" \
  bifrost-global

echo "net.ipv4.conf.bifrost-bridge.route_localnet=1" | sudo tee /etc/sysctl.d/99-docker-bifrost.conf
sudo sysctl -w net.ipv4.conf.bifrost-bridge.route_localnet=1