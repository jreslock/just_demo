FROM debian:buster-slim

ADD entrypoint.sh /entrypoint.sh
RUN apt-get -yqq update && apt-get -yqq install curl && \
    chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]