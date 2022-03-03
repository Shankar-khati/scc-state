FROM node:12.15.0-slim
MAINTAINER Jonathan Gros-Dubois

LABEL version="8.0.2"
LABEL description="Docker file for SCC State Server"

RUN mkdir -p /usr/src/
WORKDIR /usr/src/
COPY . /usr/src/

RUN npm install .

EXPOSE 7777

ENV NODE_ENV=production \
    LOG_LEVEL=3 \
    PORT=7777 \
    SENTRY_HOST=sentry.aws96.srs.lab.nordigy.ru \
    SENTRY_PORT=80 \
    SENTRY_SECRET=932bdb65fd7f43a5bb09c4111cd72ff9 \
    SENTRY_PROJECT_ID=7 \
    SENTRT_HOST_PROTOCOL=https \
    SENTRY_SEND_TIMEOUT=20

CMD ["npm", "start"]
