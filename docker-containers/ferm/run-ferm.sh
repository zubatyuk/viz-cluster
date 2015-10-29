#!/bin/sh

while true; do
  ferm /etc/ferm.conf
  echo ##################################################
  /sbin/iptables-save
  echo ##################################################
  sleep 1h
done 
