pipeline {
    agent any
    stages {
	stage ('Start Sonarqube') {
	   steps { sh './sonar-run.sh start' }
	}
	stage('Build') {
            agent {
        	docker {
            		image 'maven:3-alpine'
            		args '-e http_proxy=http://192.168.56.101:3128 -e https_proxy=http://192.168.56.101:3128'
        	}
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
