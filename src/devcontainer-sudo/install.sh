#!/bin/sh
set -e

echo "Activating feature 'devcontainer-sudo'"

install_via_apt()
{
    export DEBIAN_FRONTEND=noninteractive
    apt-get update -y
    apt-get install -y sudo
}

install_via_dnf()
{
    dnf update -y
    dnf install -y sudo
}

install_via_apk()
{
    apk update
    apk add sudo
}

install_via_pacman()
{
    pacman -Sy
    pacman -S sudo --noconfirm
}

# Install sudo
if command -v apt &>/dev/null; then
    install_via_apt
elif command -v dnf &>/dev/null; then
    install_via_dnf
elif command -v apk &>/dev/null; then
    install_via_apk
elif command -v pacman &>/dev/null; then
    install_via_pacman
fi

# Setup sudoers.d directory
mkdir -pv -m 600 /etc/sudoers.d
chown -v root:root /etc/sudoers.d

# Create sudoers folder
echo "${USER} ALL = (ALL) NOPASSWD: ALL" > /etc/sudoers.d/devcontainer-sudo
chown -v root:root /etc/sudoers.d/devcontainer-sudo
chmod 600 /etc/sudoers.d/devcontainer-sudo

echo "Done activating feature 'devcontainer-sudo'"