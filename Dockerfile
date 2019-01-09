FROM node:7-alpine

ENV http_proxy http://192.168.56.101:3128
ENV https_proxy http://192.168.56.101:3128

RUN apk add -U subversion
