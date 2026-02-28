#!/bin/bash

set -e

# Make sure directory and files exists
test -d /etc/sudoers.d
test -f /etc/sudoers.d/devcontainer-sudo

# Make sure sudo binary exists
sudo --version

# Setup test user
groupadd -g 9999 testuser
useradd -g 9999 -u 9999 testuser
echo 'testuser:testuser' | chpasswd

# Make sure testuser can use sudo without password prompt
su - testuser -c 'sudo true'