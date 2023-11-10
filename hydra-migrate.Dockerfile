FROM oryd/hydra:v2.2.0-rc.3

USER root
RUN apk add perl
COPY script /script
RUN chown -R ory:ory /script
RUN chmod -R 700 /script
USER ory
WORKDIR /script

ENTRYPOINT ["sh", "/script/hydra-migrate-script.sh"]
