#!/bin/bash
# Downloading/updating server on startup

echo "### Downloading Valheim Server ###"
mkdir -p /home/steam/valheim/data
/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/valheim +app_update 896660 validate +quit

exec "$@"
