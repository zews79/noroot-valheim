FROM steamcmd/steamcmd:latest

RUN apt-get update && \
	apt-get -y install --no-install-recommends libsdl2-2.0-0:i386 && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/valheim/data/

WORKDIR /home/valheim

ADD entrypoint.sh /home/valheim/entrypoint.sh
ADD start-server.sh /home/valheim/start-server.sh

RUN chmod +x /home/valheim/entrypoint.sh && chmod +x /home/valheim/start-server.sh

RUN chown -R 65534.65534 /home/valheim

EXPOSE 2456/udp
EXPOSE 2456/tcp
EXPOSE 2457/udp
EXPOSE 2457/tcp
EXPOSE 2458/udp
EXPOSE 2458/tcp

ENV SERVER_NAME="Valheim Server"
ENV SERVER_PASSWORD=""
ENV SERVER_WORLD="World"
ENV SERVER_PORT=2456
ENV SERVER_PUBLIC=1
ENV HOME="/home/valheim"

ENTRYPOINT  ["/bin/sh", "entrypoint.sh"]

CMD ["/bin/sh", "start-server.sh", "-n"]
