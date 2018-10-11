#!/usr/bin/env bash
set -x

# This probably should not be here
which redis-cli 2>/dev/null || {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y redis-tools
}

while :
do
  # loop infinitely
  # Batch Application to Increment key on Redis
	LEGACY_COUNTER=`redis-cli -h redis.service.consul INCR counter_legacy`
	echo "Legacy counter is now $LEGACY_COUNTER"
	
	sleep 5
done



set +x
