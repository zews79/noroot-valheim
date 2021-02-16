#!/bin/bash
# Downloading/updating server on startup

echo "### Downloading Valheim Server ###"
mkdir -p /opt/valheim/data
steamcmd +login anonymous +force_install_dir /opt/valheim/data +app_update 896660 validate +quit

exec "$@"
