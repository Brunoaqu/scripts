#!/bin/bash

zypper remove docker \
              docker-client \
              docker-client-latest \
              docker-common \
              docker-latest \
              docker-latest-logrotate \
              docker-logrotate \
              docker-engine \
              runc

zypper addrepo https://download.docker.com/linux/sles/docker-ce.repo

zypper install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
