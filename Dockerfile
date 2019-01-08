FROM sonarqube:lts
COPY plugins/checkstyle-sonar-plugin-4.11.jar /opt/sonarqube/extensions/plugins/
EXPOSE 9000
#RUN rm /opt/sonarqube/extensions/plugins/sonar-csharp-plugin-*.jar \
#       /opt/sonarqube/extensions/plugins/sonar-flex-plugin-*.jar \
#       /opt/sonarqube/extensions/plugins/sonar-php-plugin-*.jar \
#       /opt/sonarqube/extensions/plugins/sonar-python-plugin-*.jar \
#       /opt/sonarqube/extensions/plugins/sonar-typescript-plugin-*.jar \
#       /opt/sonarqube/extensions/plugins/sonar-php-plugin-*.jar
