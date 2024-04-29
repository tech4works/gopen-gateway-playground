FROM gabrielhcataldo/gopen-gateway:latest

ARG ENV_NAME
ENV ENV_NAME ${ENV_NAME}

WORKDIR /root/

COPY gopen/${ENV_NAME} ./gopen/${ENV_NAME}

CMD ./main ${ENV_NAME}
