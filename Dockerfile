FROM mongo:3.4
 
MAINTAINER <Tosho Ivanov>
 
ENV AUTH yes
ENV JOURNALING yes
 
ADD run.sh /run.sh
RUN chmod +x /run.sh

ADD set_mongodb_password.sh /set_mongodb_password.sh
RUN chmod +x /set_mongodb_password.sh

RUN mkdir -p /data/db2 && chown -R mongodb:mongodb /data/db2
 
CMD ["/run.sh"]
