#!/bin/bash

# Installation de Docker et kubectl
sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
curl -sfL https://get.k3s.io | sh -

# Informations pour l'utilisateur
echo "Docker et Kubernetes ont été installés avec succès."
