#!/bin/bash
set -e

echo "=============================="
echo " Jenkins Installation Script "
echo "=============================="

# Check root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run as root or use sudo"
  exit 1
fi

echo "👉 Updating system..."
apt update -y

echo "👉 Installing Java & dependencies..."
apt install -y fontconfig openjdk-17-jre curl gnupg

echo "👉 Adding Jenkins GPG key..."
mkdir -p /usr/share/keyrings
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "👉 Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "👉 Updating repo cache..."
apt update -y

echo "👉 Installing Jenkins..."
apt install -y jenkins

echo "👉 Starting and enabling Jenkins service..."
systemctl start jenkins
systemctl enable jenkins

echo "👉 Jenkins status:"
systemctl status jenkins --no-pager

echo "=============================="
echo " Jenkins Installed Successfully "
echo "=============================="

echo "Initial Admin Password:"
cat /var/lib/jenkins/secrets/initialAdminPassword

echo ""
echo "Access Jenkins at: http://<YOUR_PUBLIC_IP>:8080"
