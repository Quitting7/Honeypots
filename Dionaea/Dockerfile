
### Used to build the dionaea image ####
FROM dinotools/dionaea-docker

# Copy the configuration files over to the docker image
#COPY dionaea.yaml /opt/dionaea/etc/dionaea/services-enabled/
#COPY ihandler.yaml /opt/dionaea/etc/dionaea/ihandlers-enabled/

RUN apt-get update && apt-get install net-tools -y

COPY log_json.yaml /opt/dionaea/etc/dionaea/ihandlers/
EXPOSE 21 42 69 80 135 443 445 1433 1723 1883 1900 3306 5060 11211
