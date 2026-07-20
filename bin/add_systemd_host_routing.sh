#!/usr/bin/env bash

if ! grep -qxF "net.ipv4.conf.bifrost-bridge.route_localnet=1" /etc/sysctl.d/99-docker-bifrost.conf 2>/dev/null; then
  echo "net.ipv4.conf.bifrost-bridge.route_localnet=1" | sudo tee /etc/sysctl.d/99-docker-bifrost.conf
fi
sudo sysctl -w net.ipv4.conf.bifrost-bridge.route_localnet=1