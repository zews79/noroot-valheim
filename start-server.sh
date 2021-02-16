export temp_ldpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/valheim/linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

cp /opt/valheim/linux64/steamclient.so /opt/valheim

export LD_LIBRARY_PATH=$temp_ldpath

echo "### Starting Valheim server ###"
while true; do
/opt/valheim/valheim_server.x86_64 \
  -name ${SERVER_NAME} \
  -port ${SERVER_PORT} \
  -world ${SERVER_WORLD} \
  -password ${SERVER_PASSWORD} \
  -public ${SERVER_PUBLIC}
done
