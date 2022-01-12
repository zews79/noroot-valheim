FROM cm2network/steamcmd:latest

USER 0

RUN apt-get update && \
	apt-get -y install --no-install-recommends libsdl2-2.0-0:i386 && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/steam/valheim

#WORKDIR /opt/valheim

ADD entrypoint.sh /home/steam/entrypoint.sh
ADD start-server.sh /home/steam/start-server.sh

RUN chmod +x /home/steam/entrypoint.sh && chmod +x /home/steam/start-server.sh

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
ENV HOME="/home/steam"

RUN chown -R 1000:1000 /home/steam

USER 1000

ENTRYPOINT  ["/bin/sh", "/home/steam/entrypoint.sh"]

CMD ["/bin/sh", "/home/steam/start-server.sh", "-n"]
