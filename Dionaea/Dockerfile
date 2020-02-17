# docker build . --tag=dionaea

### Used to build the dionaea image ####
FROM dinotools/dionaea-docker

# Copy the configuration files over to the docker image
#COPY ihandler.yaml /opt/dionaea/etc/dionaea/ihandlers-enabled/

RUN apt-get update && apt-get install net-tools vim sqlite3 p0f -y
RUN mkdir /opt/logdio
RUN mkdir /opt/sqldio
RUN mkdir /opt/default_dio

COPY dionaea.cfg /opt/dionaea/etc/dionaea/dionaea.cfg
COPY log_sqlite.yaml /opt/dionaea/etc/dionaea/ihandlers/
COPY log_json.yaml /opt/dionaea/etc/dionaea/ihandlers/

EXPOSE 21 42 69 80 135 443 445 1433 1723 1883 1900 3306 5060 11211
