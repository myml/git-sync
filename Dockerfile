FROM debian
COPY git-sync.sh /
RUN apt-get update 
RUN apt-get install -y git httpie ca-certificates
ENTRYPOINT ["/git-sync.sh"]
