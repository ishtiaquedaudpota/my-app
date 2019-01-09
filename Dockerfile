FROM node:7-alpine

ENV http_proxy http://proxy-central.det.wa.edu.au:8080
ENV https_proxy http://proxy-central.det.wa.edu.au:8080

RUN apk add -U subversion
