FROM golang:1.12-alpine3.9

RUN apk update && apk upgrade && \
    apk add --no-cache git tzdata

RUN cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
RUN echo "Europe/Amsterdam" >  /etc/timezone