#!/bin/bash

# Update package list
sudo apt update

# Install Docker
if ! command -v docker &> /dev/null; then
    echo "Installing Docker..."
    sudo apt install -y docker.io
else
    echo "Docker is already installed."
fi

# Install Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "Installing Docker Compose..."
    sudo apt install -y docker-compose
else
    echo "Docker Compose is already installed."
fi

# Install Python
if ! command -v python3 &> /dev/null; then
    echo "Installing Python..."
    sudo apt install -y python3
else
    echo "Python is already installed."
fi

# Install pip if missing
if ! command -v pip3 &> /dev/null; then
    echo "Installing pip..."
    sudo apt install -y python3-pip python3-venv
fi

# Install Django
if ! command -v django-admin &> /dev/null; then
    echo "Installing Django..."
    python3 -m pip install django
else
    echo "Django is already installed."
fi

echo "Installation completed!"
