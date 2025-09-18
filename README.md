=# Docker Volume Persistence Lab

## 🎯 Objectif
Ce TP présente des instructions pour gérer le **stockage persistant en informatique**.  
Les tâches comprennent :  
- Création de volumes Docker  
- Démarrage de conteneurs Ubuntu et montage des volumes  
- Création d’un fichier dans un conteneur et vérification de sa présence dans un autre  
- Hébergement d’un site web avec un conteneur Apache (optionnel / bonus)

Le TP permet de démontrer la **persistance des données entre plusieurs conteneurs** grâce aux volumes Docker.

---

## 🛠 Prérequis
- Une machine Linux avec Docker installé
- Connaissances de base en ligne de commande

---

## 🚀 Étapes du TP

### 1️⃣ Méthode manuelle (pas-à-pas)
1. **Créer un volume Docker**  
```bash
docker volume create --name share
