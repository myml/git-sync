FROM alpine/git
COPY git-sync.sh /
ENTRYPOINT ["/git-sync.sh"]