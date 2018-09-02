FROM centos:latest

ADD ./special/mongodb-org.repo /etc/yum.repos.d/mongodb-org.repo
ADD ./special/20-nproc.conf /etc/security/limits.d/20-nproc.conf

WORKDIR /

RUN yum install -y mongodb-org && \
    yum install -y mongodb-org-server && \
    yum install -y mongodb-org-shell && \
    yum install -y mongodb-org-mongos && \
    yum install -y mongodb-org-tools

EXPOSE 27017 27018 27019
VOLUME ["/var/log/mongodb"]

CMD ["mongod", "--logpath", "/var/log/mongodb/mongod.log", "--dbpath", "/var/lib/mongodb"]
