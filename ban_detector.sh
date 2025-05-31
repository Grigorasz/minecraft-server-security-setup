#!/bin/bash

# Log de intrări jucători (simulat)
LOG_FILE="/path/to/server/logs/latest.log"
BANNED_IPS="/path/to/server/banned-ips.txt"

# Cât de multe apariții sunt considerate suspicioase?
THRESHOLD=10

echo "Scanning for suspicious IPs..."

# Caută IP-uri care apar de prea multe ori în log
grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "$LOG_FILE" | sort | uniq -c | sort -nr | while read count ip; do
    if [ "$count" -ge "$THRESHOLD" ]; then
        echo "Suspicious IP detected: $ip ($count times)"
        
        # Verifică dacă IP-ul este deja banat
        if ! grep -q "$ip" "$BANNED_IPS"; then
            echo "$ip" >> "$BANNED_IPS"
            echo "IP $ip has been banned."
        fi
    fi
done
