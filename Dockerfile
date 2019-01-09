FROM maven:3.6.0-jdk-8-alpine
COPY ../../script/files/proxy.sh /etc/profile.d/
