# Download eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

# Move binary to PATH
sudo mv /tmp/eksctl /usr/local/bin

# Verify
eksctl version
