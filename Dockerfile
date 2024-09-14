FROM alpine/git
COPY git-sync.sh /
RUN apk -U --no-cache add httpie
ENTRYPOINT ["/git-sync.sh"]