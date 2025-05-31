#!/bin/bash

# Locația unde se află serverul
SERVER_DIR="/path/to/minecraft/server"
BACKUP_DIR="/path/to/local/NAS/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Creează folderul dacă nu există
mkdir -p "$BACKUP_DIR"

# Creează arhiva backup
tar -czf "$BACKUP_DIR/mc_backup_$TIMESTAMP.tar.gz" "$SERVER_DIR"

# Opțional: șterge backup-urile mai vechi de 7 zile
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "Backup complet la ora $TIMESTAMP"
