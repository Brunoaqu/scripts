# Remove old if exists
apt remove docker docker-engine docker.io containerd runc -y

# Update the apt package index and install packages to allow apt to use a repositoryover HTTPS
apt update -y
apt install ca-certificates curl gnupg lsb-release -y

# Add Docker’s official GPG key
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package index
apt update -y

# Install docker latest release
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
