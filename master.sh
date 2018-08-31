#!/bin/bash


kubeadm init --token abcdef.0123456789abcdef --apiserver-advertise-address 192.168.99.100 --pod-network-cidr=10.200.0.0/16

cp /etc/kubernetes/admin.conf /vagrant/admin.conf

systemctl daemon-reload
systemctl restart kubelet

echo "sleeping 1 minute"
sleep 60

kubectl --kubeconfig='/vagrant/admin.conf' apply -f /vagrant/rbac-kdd.yaml
kubectl --kubeconfig='/vagrant/admin.conf' apply -f /vagrant/calico.yaml

