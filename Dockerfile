FROM debian
COPY git-sync.sh /
RUN apt-get update 
RUN apt-get install -y httpie ca-certificates
ENTRYPOINT ["/git-sync.sh"]