# https://hub.docker.com/r/adoabreu/chatwoot/tags
FROM adoabreu/chatwoot:latest

RUN apk add --no-cache multirun postgresql-client

COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]

CMD ["start.sh"]