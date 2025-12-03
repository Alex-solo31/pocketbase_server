#!/bin/sh

# Crée ou met à jour le superuser dans le même dossier de données
pocketbase superuser upsert alexandre.cubaynes@gmail.com "AdminTemp123!" --dir /pbdata2 || true

# Lance le serveur PocketBase
exec pocketbase serve --http=0.0.0.0:8080 --dir /pbdata2
