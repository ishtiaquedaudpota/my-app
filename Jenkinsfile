pipeline {
    agent any
    stages {
        stage('Build Sonar') {
            steps {
                sh '''
			docker network create mynet
			docker run --name postgres -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -d -p 5432:5432 --net mynet postgres
			docker run --name sonarqube -p 9000:9000 -e SONARQUBE_JDBC_USERNAME=sonar -e SONARQUBE_JDBC_PASSWORD=sonar -e SONARQUBE_JDBC_URL=jdbc:postgresql://postgres:5432/sonar -d --net mynet sonarqube
                	sleep 60
		'''
            }
        }
	stage('Analyse') {
		tools { maven 'Maven' }
		steps { sh 'mvn clean package sonar:sonar' }
	}
	stage('wait') {
            steps { input "Does the staging environment look ok?" }
        }
    }
    post {
    	always {
            sh '''
		docker stop sonarqube
		docker stop postgres
		docker rm sonarqube
		docker rm postgres
		docker network rm mynet
		'''
	}
    }
}
