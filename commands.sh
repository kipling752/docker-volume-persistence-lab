#!/bin/bash
# TP : Docker Volume Persistence Lab
# Objectif : démontrer la persistance des données avec un volume partagé

echo "=== 1. Création du volume ==="
docker volume create --name share

echo "=== 2. Démarrage des conteneurs Ubuntu partageant le même volume ==="
docker run -it --name ubuntu1 -v share:/tmp -d ubuntu /bin/bash
docker run -it --name ubuntu2 -v share:/tmp -d ubuntu /bin/bash

echo "=== 3. Création d'un fichier depuis ubuntu1 ==="
docker exec -it ubuntu1 /bin/bash -c "touch /tmp/toto.txt && ls -l /tmp/"

echo "=== 4. Vérification depuis ubuntu2 ==="
docker exec -it ubuntu2 /bin/bash -c "ls /tmp/"
docker exec -it ubuntu2 /bin/bash -c "echo 'Principe leader to eazytraining' > /tmp/toto.txt"

echo "=== 5. Lecture du fichier modifié dans ubuntu1 ==="
docker exec -it ubuntu1 /bin/bash -c "cat /tmp/toto.txt"

echo "=== 6. Suppression du conteneur ubuntu1 ==="
docker rm -f ubuntu1

echo "=== 7. Restauration avec un nouveau conteneur utilisant le même volume ==="
docker run -it --name ubuntu1-restore -v share:/tmp -d ubuntu /bin/bash
docker exec -it ubuntu1-restore /bin/bash -c "cat /tmp/toto.txt"

echo "=== Fin du TP : persistance confirmée ==="

# --------------------------
# BONUS : Nettoyage automatique
# --------------------------
echo "=== Bonus : Nettoyage ==="
docker rm -f ubuntu2 ubuntu1-restore
docker volume rm share
echo "=== Nettoyage terminé : tous les conteneurs et le volume ont été supprimés ==="

