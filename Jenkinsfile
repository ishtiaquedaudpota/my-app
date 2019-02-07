pipeline {
    agent any
    stages {
	stage ('Start Sonarqube') {
	   steps { sh './sonar-run.sh start' }
	}
	stage('Build') {
            agent {
        	docker { image 'maven:3-alpine' }
    	     }
	     steps { 
                sh 'mvn clean package sonar:sonar -Dsonar.host.url=${SONAR_URL} -Dsonar.login=${SONAR_TOKEN}'
            }
        }
    }
     post {
     	   always {
        	sh './sonar-run.sh stop'
            	deleteDir()
           }
     }
}
