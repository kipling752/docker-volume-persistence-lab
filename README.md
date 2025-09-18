# Docker Volume Persistence Lab

## 🎯 Objectif
Ce TP a pour but de démontrer la persistance des données dans Docker en utilisant un **volume partagé** entre plusieurs conteneurs Ubuntu.

---

## 🛠 Prérequis
- Une machine Linux avec Docker installé
- Connaissances de base en ligne de commande

---

## 🚀 Étapes du TP

### 1️⃣ Création d’un volume Docker
```bash
docker volume create --name share

