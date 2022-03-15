FROM oryd/hydra:v1.10.6-alpine

USER root
RUN apk add perl
COPY script /script
RUN chown -R ory:ory /script
RUN chmod -R 700 /script
USER ory
WORKDIR /script

ENTRYPOINT ["sh","/script/hydra-script.sh"]