#!/bin/bash

# Start a Docker swarm cluster
docker swarm init

# Retrieve the join token for worker nodes
token=$(docker swarm join-token -q worker)

# Get the name of the current instance
instance_name=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name?alt=text)
zone=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/zone?alt=text)

# Extract just the zone name from the full URL
zone=${zone##*/}

# Set the metadata for the instance with the join token
gcloud compute instances add-metadata $instance_name --zone $zone --metadata swarm-join-token=$token

echo "Swarm cluster initialized"
echo "Join token for worker nodes: $token"
echo "Instance metadata updated with join token"
