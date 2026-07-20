#!/usr/bin/env bash

docker network create \
  --driver bridge \
  -o "com.docker.network.bridge.name"="bifrost-bridge" \
  bifrost-global

if ! grep -qxF "net.ipv4.conf.bifrost-bridge.route_localnet=1" /etc/sysctl.d/99-docker-bifrost.conf 2>/dev/null; then
  echo "net.ipv4.conf.bifrost-bridge.route_localnet=1" | sudo tee /etc/sysctl.d/99-docker-bifrost.conf
fi
sudo sysctl -w net.ipv4.conf.bifrost-bridge.route_localnet=1