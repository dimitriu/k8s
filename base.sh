#!/bin/bash

apt-get update

apt autoremove -y snapd lxc-common lxd
apt-get install -qy apt-transport-https ca-certificates curl software-properties-common

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/docker.list
deb https://download.docker.com/linux/ubuntu xenial stable
EOF
apt-get update
apt-get install -qy docker-ce


# kubernetes
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -qy kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
