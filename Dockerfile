FROM mongo:3.5

RUN mkdir -p /data/db2 \
    && echo "dbpath = /data/db2" > /etc/mongodb.conf \
    && chown -R mongodb:mongodb /data/db2

CMD ["mongod", "--config", "/etc/mongodb.conf", "--smallfiles", "--bind_ip_all"]
