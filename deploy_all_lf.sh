#!/bin/bash

# Script principal pour automatiser le déploiement

# Exécuter le script d'installation de Docker et Kubernetes
./install_docker_kubernetes_lf.sh
sudo systemctl start k3s

# Attendre jusqu'à ce que le cluster Kubernetes soit prêt
#until kubectl cluster-info &> /dev/null; do
    #echo "En attente que le cluster Kubernetes soit prêt..."
    #sleep 5
#done

# Création de notre namespace faelamine
sudo k3s kubectl apply -f faelamine-namespace.yaml

# Exécuter le script de déploiement de l'application
./deploy_application_lf.sh

# Exécuter le script de déploiement de la base de données
./deploy_database_lf.sh

echo "Le déploiement complet a été effectué avec succès."
echo "Lien : http://$(sudo k3s kubectl get services mon-app-service -n faelamine -o jsonpath='{.status.loadBalancer.ingress[0].ip}'):83"
echo "Pour accéder à la base de données : sudo mysql -h $(sudo k3s kubectl get services ma-bd-service -n faelamine -o jsonpath='{.status.loadBalancer.ingress[0].ip}'):3306 -P 3306 -u <user> -p"
