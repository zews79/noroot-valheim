FROM cm2network/steamcmd:latest

USER 0
RUN apt-get update && \
	apt-get -y install --no-install-recommends libsdl2-2.0-0:i386 && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/valheim

WORKDIR /opt/valheim

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ADD start-server.sh /usr/local/bin/start-server.sh

RUN chmod +x /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/start-server.sh

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
ENV HOME="/opt/valheim"

USER 65534

ENTRYPOINT  ["/bin/sh", "/usr/local/bin/entrypoint.sh"]

CMD ["/bin/sh", "/usr/local/bin/start-server.sh", "-n"]
