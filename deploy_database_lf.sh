#!/bin/bash

# Chemin vers le fichier de déploiement de la base de données
DB_DEPLOYMENT_FILE="database-deployment.yaml"

# Nom du déploiement de la base de données
DB_DEPLOYMENT_NAME="ma-bd-deployment"

# Appliquer le déploiement en utilisant kubectl
kubectl apply -f "$DB_DEPLOYMENT_FILE"
