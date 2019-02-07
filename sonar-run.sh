#!/bin/bash
 
NETWORK_NAME=sonarnet
SONAR_NAME=sonarqube
SONAR_PORT=9000
SONAR_VERSION=lts      #Latest version
POSTGRES_NAME=postgres
POSTGRES_USER=sonar
POSTGRES_PASSWORD=sonar
POSTGRES_PORT=5432
POSTGRES_VERSION=10.6   # Its the tested version
PLUGIN_DIR=$(dirname $0)/plugins
 
if [ -z $1 ] && [ -n $1 ]; then
echo "Usage: ./sonar-run.sh start|stop|status"
exit 1
fi
 
if [ $1 == "start" ]; then
echo -e "\n---Creating docker network $NETWORK_NAME---"
docker network create $NETWORK_NAME
 
 
echo -e "\n---Creating Postgresql container---"
docker run -d \
--name $POSTGRES_NAME \
--net $NETWORK_NAME \
-e POSTGRES_USER=$POSTGRES_USER \
-e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
-v pgdata:/var/lib/postgresql/data \
postgres:$POSTGRES_VERSION
 
echo -e "\n---Creating Sonarqube container---"
docker run -d \
--name $SONAR_NAME \
--net $NETWORK_NAME \
-e SONARQUBE_JDBC_USERNAME=$POSTGRES_USER \
-e SONARQUBE_JDBC_PASSWORD=$POSTGRES_PASSWORD \
-e SONARQUBE_JDBC_URL=jdbc:postgresql://$POSTGRES_NAME:$POSTGRES_PORT/$POSTGRES_USER \
-v sonar_conf:/opt/sonarqube/conf \
-v sonar_logs:/opt/sonarqube/logs \
-v sonar_extensions:/opt/sonarqube/extensions \
-v sonar_data:/opt/sonarqube/data \
-p $SONAR_PORT:$SONAR_PORT \
sonarqube:$SONAR_VERSION
 
# docker cp $PLUGIN_DIR/checkstyle-sonar-plugin-4.11.jar sonarqube:/opt/sonarqube/extensions/plugins/
elif [ $1 == "stop" ]; then
echo -e "\n--- Cleanup Sonarqube container ---"
docker stop $SONAR_NAME
docker rm $SONAR_NAME
 
echo -e "\n--- Cleanup Postgres container ---"
docker stop $POSTGRES_NAME
docker rm $POSTGRES_NAME
 
echo -e "\n--- Removing $NETWORK_NAME network ---"
docker network rm $NETWORK_NAME
#docker rmi $(docker images -q)
 
elif [ $1 == "status" ]; then
docker ps -a
else
echo "Usage: ./sonar-run.sh start|stop|status"
fi
