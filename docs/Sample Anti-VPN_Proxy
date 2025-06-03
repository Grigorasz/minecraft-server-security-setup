package com.exemplu.antivpn;

import org.bukkit.event.Listener;
import org.bukkit.event.EventHandler;
import org.bukkit.event.player.PlayerLoginEvent;
import org.bukkit.plugin.java.JavaPlugin;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class AntiVPNPlugin extends JavaPlugin implements Listener {

    private String apiKey;

    @Override
    public void onEnable() {
        // Încarcă cheia API din config.yml
        saveDefaultConfig();
        apiKey = getConfig().getString("api-key");
        if (apiKey == null || apiKey.isEmpty()) {
            getLogger().severe("API key nu este setata in config.yml!");
            getServer().getPluginManager().disablePlugin(this);
            return;
        }
        getServer().getPluginManager().registerEvents(this, this);
        getLogger().info("AntiVPN plugin pornit!");
    }

    @EventHandler
    public void onPlayerLogin(PlayerLoginEvent event) {
        String ip = event.getAddress().getHostAddress();
        getLogger().info("Verific IP: " + ip);

        if (esteVPN(ip)) {
            event.disallow(PlayerLoginEvent.Result.KICK_OTHER, "Acces interzis prin VPN/Proxy!");
            getLogger().info("Jucatorul a fost blocat, VPN detectat.");
        }
    }

    private boolean esteVPN(String ip) {
        try {
            URL url = new URL("https://api.antivpn.io/v1/" + ip);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", "Bearer " + apiKey);
            con.setConnectTimeout(5000);
            con.setReadTimeout(5000);

            int status = con.getResponseCode();
            if (status != 200) {
                getLogger().warning("Eroare la API, status: " + status);
                return false;
            }

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            in.close();
            con.disconnect();

            String raspuns = content.toString();
            return raspuns.contains("\"vpn\":true");

        } catch (Exception e) {
            getLogger().warning("Eroare la verificare VPN: " + e.getMessage());
            return false;
        }
    }
}
