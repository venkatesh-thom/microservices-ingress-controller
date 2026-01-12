#!/bin/bash

set -e

echo "Updating packages..."
sudo apt update -y

echo "Installing curl..."
sudo apt install -y curl

echo "Downloading latest kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

echo "Making kubectl executable..."
chmod +x kubectl

echo "Moving kubectl to /usr/local/bin..."
sudo mv kubectl /usr/local/bin/

echo "Verifying kubectl version..."
kubectl version --client


echo "kubectl installation completed successfully ✅"
