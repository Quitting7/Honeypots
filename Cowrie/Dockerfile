FROM cowrie/cowrie

COPY cowrie.cfg /cowrie/cowrie-git/etc/cowrie.cfg

USER root
RUN apt-get update && apt-get install net-tools -y
USER cowrie

EXPOSE 2222
