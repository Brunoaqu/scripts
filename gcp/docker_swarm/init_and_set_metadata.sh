#!/bin/bash

# Start a Docker swarm cluster
docker swarm init

# Retrieve the join token for worker nodes
token=$(docker swarm join-token -q worker)

# Set the metadata for the instance with the join token
gcloud compute instances add-metadata $(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/name) --metadata swarm-join-token=$token
