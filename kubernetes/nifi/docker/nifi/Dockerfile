FROM       bjornmooijekind/nifi-base:1.8.0
MAINTAINER Bjorn Mooijekind <bjmooijekind@gmail.com>
ENV        BANNER_TEXT="" \
           S2S_PORT=""
COPY       start_nifi.sh /${NIFI_HOME}/
VOLUME     /opt/datafiles \
           /opt/scriptfiles \
           /opt/certfiles
WORKDIR    ${NIFI_HOME}
RUN        chmod +x ./start_nifi.sh
CMD        ./start_nifi.sh
