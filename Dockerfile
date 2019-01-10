FROM maven:3.6.0-jdk-8-alpine

# Create Jenkins User
RUN adduser -D -s /bin/bash jenkins

