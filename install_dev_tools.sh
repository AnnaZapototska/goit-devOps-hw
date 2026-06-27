#!/bin/bash

set -e

# Update package list
echo "Updating package list..."
sudo apt update

# Install Docker CE
if ! command -v docker &> /dev/null; then

    echo "Docker not found. Installing Docker CE..."

    sudo apt install -y ca-certificates curl gnupg lsb-release

    sudo install -m 0755 -d /etc/apt/keyrings

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
        | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
      | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update

    sudo apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin

    echo "Docker installed successfully."

else

    echo "Docker is already installed."

fi

# Verify Docker Compose Plugin

if ! docker compose version &> /dev/null; then

    echo "Installing Docker Compose Plugin..."

    sudo apt install -y docker-compose-plugin

fi


# Check Python Version

INSTALL_PYTHON=false

if command -v python3 &> /dev/null; then

    if python3 -c "import sys; exit(0 if sys.version_info >= (3,9) else 1)"
    then

        echo "Compatible Python version found:"
        python3 --version

    else

        echo "Python version is lower than 3.9."
        INSTALL_PYTHON=true

    fi

else

    echo "Python is not installed."
    INSTALL_PYTHON=true

fi


# Install Python 3.9

if [ "$INSTALL_PYTHON" = true ]; then

    echo "Installing Python 3.9..."

    sudo apt install -y software-properties-common

    sudo add-apt-repository ppa:deadsnakes/ppa -y

    sudo apt update

    sudo apt install -y \
        python3.9 \
        python3.9-venv \
        python3.9-dev \
        python3-pip

    echo "Python 3.9 installed."

fi


# Verify pip

if ! command -v pip3 &> /dev/null; then

    echo "Installing pip..."

    sudo apt install -y python3-pip

fi

# Check Django
if python3 -c "import django" &> /dev/null; then

    echo "Django is already installed."

else

    echo "Installing Django..."

    # Ubuntu 24.04+ implements PEP 668.
    # --break-system-packages is required to allow pip installation
    # outside Debian package management.
    pip3 install --user --break-system-packages django

fi

echo ""
echo " Installation completed successfully!"

echo ""
echo "Installed versions:"

docker --version
docker compose version
python3 --version
pip3 --version
