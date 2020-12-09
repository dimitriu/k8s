#!/bin/bash


kubeadm init --token abcdef.0123456789abcdef --apiserver-advertise-address 192.168.99.100 --pod-network-cidr=10.200.0.0/16

cp /etc/kubernetes/admin.conf /vagrant/admin.conf

systemctl daemon-reload
systemctl restart kubelet

echo "sleeping 1 minute" && sleep 60


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f /vagrant/rbac-kdd.yaml
kubectl apply -f /vagrant/tigera-operator.yaml
kubectl apply -f /vagrant/calico.yaml

curl -o sono.tgz -kL https://github.com/vmware-tanzu/sonobuoy/releases/download/v0.19.0/sonobuoy_0.19.0_linux_amd64.tar.gz
tar xzvf sono.tgz
./sonobuoy run --mode=certified-conformance
