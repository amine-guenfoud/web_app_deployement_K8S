#!/bin/bash

# Chemin vers le fichier de déploiement de l'application
DEPLOYMENT_FILE="app-deployment.yaml"

# Nom du déploiement
DEPLOYMENT_NAME="mon-app-deployment"

# Appliquer le déploiement en utilisant kubectl
sudo k3s kubectl apply -f "$DEPLOYMENT_FILE"
