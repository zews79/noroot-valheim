#!/bin/bash
# Downloading/updating server on startup

echo "### Downloading Valheim Server ###"
mkdir -p /opt/valheim/data
/home/steam/steamcmd/linux32/steamcmd +login anonymous +force_install_dir /home/steam/valheim +app_update 896660 validate +quit

exec "$@"
