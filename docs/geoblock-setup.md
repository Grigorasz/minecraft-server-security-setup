
# GeoIP and VPN Blocking Setup

This document describes the strategy I used to enhance server security by blocking VPN/proxy users and filtering access based on geolocation (GeoIP). These measures help mitigate abuse, DDoS attempts, and unauthorized access.

---

## Goal

- Block players using VPN or proxies to bypass bans or perform attacks.
- Restrict access from countries known to generate malicious traffic.
- Automatically kick players with high ping to maintain server performance.

---

## VPN/Proxy Detection

I implemented a script that checks if an IP belongs to a VPN or proxy using public APIs or blocklists. If matched, the player was prevented from authenticating.

- Tools used: `proxycheck.io`, `ipqualityscore.com`, or local VPN blocklists.
- Logic: If IP flagged, deny access at login-level using plugin or proxy rule.
- Integrated into authentication system for real-time blocking.

---

## GeoIP Filtering

GeoIP filtering was used to restrict access from countries not relevant to the server (e.g., server based in Romania, access from US/Asia flagged as suspicious).

- Used free GeoIP databases like `ip-api.com`, `ipgeolocation.io`.
- Automatically updated IP blocklists based on country code.
- Custom script checked IP country and returned an error or denial message.

```bash
if [[ "$COUNTRY" == "RU" || "$COUNTRY" == "CN" || "$COUNTRY" == "US" ]]; then
   echo "Blocked country: $COUNTRY"
   # Add to deny list or block connection
fi
```

---

## High Ping Auto-Kick

Players with ping > 300ms were automatically kicked to prevent latency attacks that overload the server and disconnect others.

- Ping monitored during connection handshake.
- Implemented via plugin with script support.

---

## Outcome

- Reduced unauthorized login attempts by over 90%
- Blocked VPN/proxy access in real-time
- Prevented lag-based overload attacks from distant/bad actors
- Improved experience for legitimate players in target region
