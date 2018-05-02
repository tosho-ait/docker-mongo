FROM mongo:3.5

MAINTAINER <Tosho Ivanov> 

ENV AUTH yes
ENV STORAGE_ENGINE wiredTiger
ENV JOURNALING yes

RUN mkdir -p /data/db2 && chown -R mongodb:mongodb /data/db2
    
ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh
 
CMD ["/run.sh"]

#CMD ["mongod", "--config", "/etc/mongodb.conf", "--smallfiles", "--bind_ip_all"]
