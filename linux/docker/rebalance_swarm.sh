#!/bin/bash

# Get the IDs of all running containers
container_ids=$(docker ps --format "{{.ID}}")

# Iterate through each container ID and force rebalance
for container_id in $container_ids; do
    echo "Forcing rebalance for container ID: $container_id"
    docker service update --force --update-order start-first $container_id
done
