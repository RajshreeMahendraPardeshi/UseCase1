apt update && apt-get install sudo wget unzip -y && apt-get install -y gnupg curl && rm -rf /var/lib/apt/lists/*
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.lista > /dev/null
sudo apt update && sudo apt install packer
packer -version
