#!/bin/bash
sudo sysctl -w net.ipv4.ip_default_ttl=65
cat /proc/sys/net/ipv4/ip_default_ttl 
