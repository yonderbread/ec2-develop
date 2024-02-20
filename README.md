# Setting up Docker development enviorment
Before deploying the docker container, install the required packages.

1. Add docker official repo to apt
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

2. Install the packages
```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

3. Make sure to enable buildkit in `/etc/docker/daemon.json`
```json
{
    "features": {
        "buildkit": true
    }
}
```

4. Move into directory with Docker file and build the image.

```bash
cd ec2-develop
DOCKER_BUILDKIT=1 docker build .
```

# Utilize the newly setup docker enviorment
