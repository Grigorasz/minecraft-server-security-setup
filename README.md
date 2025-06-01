# Minecraft Server Infrastructure & Security Hardening

This repository documents the infrastructure, automation, and security measures I implemented while managing Minecraft servers (both local and cloud-hosted). The goal was to build a secure, optimized, and scalable setup that could resist DDoS attacks, prevent abuse, and maintain a good player experience.

## 🔧 Technologies Used

- **Microsoft Azure** – VM hosting
- **Linux (Ubuntu)** – server environment
- **Cloudflare** – DDoS and bot protection
- **Wireshark** – packet analysis and traffic monitoring
- **Multicraft & BungeeCord** – server orchestration
- **Bash Scripting** – automation (backup, bans, ping filter)
- **Discord Integration** – real-time alerts and logs
- **Geo-IP Filtering** – region-based access control

## 🛠️ Key Features

- DDoS and bot attack mitigation using Cloudflare + proxy plugins
- VPN/proxy access blocking with automated detection scripts
- GeoIP-based country blocking and logging for location analytics
- High-ping auto-kick system to preserve server performance
- Packet inspection using Wireshark to identify malicious IPs
- Daily automated backups stored on local NAS with retention cleanup
- Discord alerts for bans and suspicious activity
- Dynamic resource configuration (RAM, CPU, disk) for optimal cost-performance balance
- Patched server-side exploits (e.g. rank manipulation, crash bugs)


## 📜 Scripts Overview

### `sbackup.sh`
Creates a timestamped `.tar.gz` archive of the server directory and stores it on a mounted NAS location. Deletes backups older than 7 days automatically.

### `sban_detector.sh`
Parses the server log file for repeated IPs and adds them to the banned list if they exceed a connection threshold. Avoids duplicate entries.

### `Anti VPN_Proxy`
Plugin that can detect and block up to 98% of users using VPN or Proxy trying to connect to the server, using the antivpn.io API to identify the IP address.

## 📌 Disclaimer

This project was originally developed as a personal initiative to secure and manage Minecraft servers. All security concepts implemented are applicable in real-world infrastructure and reflect practical IT/networking knowledge.

## 📬 Contact

Feel free to reach out via [LinkedIn](https://www.linkedin.com/in/grigore-andrei-crivineanu-70041a1b9/) or [GitHub Issues](https://github.com).
