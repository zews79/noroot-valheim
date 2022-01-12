export temp_ldpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/steam/valheim/linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

cp /home/steam/valheim/linux64/steamclient.so /home/steam/valheim

export LD_LIBRARY_PATH=$temp_ldpath

echo "### Starting Valheim server ###"
while true; do
/home/steam/valheim/valheim_server.x86_64 \
  -name ${SERVER_NAME} \
  -port ${SERVER_PORT} \
  -world ${SERVER_WORLD} \
  -password ${SERVER_PASSWORD} \
  -public ${SERVER_PUBLIC}
done
