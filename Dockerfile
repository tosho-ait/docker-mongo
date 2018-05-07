FROM mongo:3.4
 
MAINTAINER <Tosho Ivanov>
 
ENV AUTH yes
ENV STORAGE_ENGINE wiredTiger
ENV JOURNALING yes
 
ADD run.sh /run.sh
RUN chmod +x /run.sh

ADD set_mongodb_password.sh /set_mongodb_password.sh
RUN chmod +x /set_mongodb_password.sh
 
CMD ["/run.sh"]

#FROM mongo:3.5
#MAINTAINER <Tosho Ivanov> 
#ENV AUTH yes
#ENV STORAGE_ENGINE wiredTiger
#ENV JOURNALING yes
#RUN mkdir -p /data/db2 && chown -R mongodb:mongodb /data/db2
#ADD run.sh /run.sh
#ADD set_mongodb_password.sh /set_mongodb_password.sh
#CMD ["/run.sh"]
#CMD ["mongod", "--config", "/etc/mongodb.conf", "--smallfiles", "--bind_ip_all"]
