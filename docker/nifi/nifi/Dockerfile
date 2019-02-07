FROM turingml/nifi-base:1.8.0

MAINTAINER Turing ML <turingml@gmail.com>

ENV BANNER_TEXT="" \
    S2S_PORT=""

COPY start_nifi.sh /${NIFI_HOME}/

COPY nifi-prometheus-nar-1.8.0.nar /${NIFI_HOME}/lib
# Strange ownership, seems like something related to MacOS developement of NiFi
RUN chown -R 501:dialout /${NIFI_HOME}/lib
RUN chmod g+w /${NIFI_HOME}/lib/nifi-prometheus-nar-1.8.0.nar

VOLUME /opt/datafiles \
    /opt/scriptfiles \
    /opt/certfiles

WORKDIR ${NIFI_HOME}

RUN chmod +x ./start_nifi.sh

CMD ./start_nifi.sh
