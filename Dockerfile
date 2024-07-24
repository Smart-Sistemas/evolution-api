FROM node:20.10.0-alpine3.18 AS builder

LABEL version="1.8.0" description="Api to control whatsapp features through http requests." 
LABEL maintainer="Davidson Gomes" git="https://github.com/DavidsonGomes"
LABEL contact="contato@agenciadgcode.com"

RUN apk update && apk upgrade && apk add --no-cache git tzdata ffmpeg wget curl

WORKDIR /evolution
COPY ./package.json .
RUN npm install
RUN npm install @ffmpeg-installer/linux-arm64

COPY . .
RUN npm run build


FROM node:20.10.0-alpine3.18 AS final

ENV TZ=America/Sao_Paulo
ENV DOCKER_ENV=true
ENV LOG_LEVEL=ERROR,WARN,DEBUG,INFO,LOG,VERBOSE,DARK,WEBHOOKS
ENV LOG_COLOR=true
ENV LOG_BAILEYS=error

WORKDIR /evolution
COPY --from=builder /evolution .

RUN npm install @ffmpeg-installer/linux-arm64

EXPOSE 80

CMD [ "node", "./dist/src/main.js" ]
