

# Update packages
sudo apt update -y

# Install required tools
sudo apt install -y curl unzip

# Download AWS CLI v2 (correct URL)
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip

# Check file size (should be ~60–70 MB)
ls -lh awscliv2.zip

# Unzip installer
unzip awscliv2.zip

# Install AWS CLI
sudo ./aws/install

# Verify installation
aws --version
