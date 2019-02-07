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
            		args '-e http_proxy=http://localhost:3128 -e https_proxy=http://localhost:3128'
        	}
    	     }
	     steps { 
                sh '''
			mvn clean package sonar:sonar -DproxySet=true -Dhttp.proxyHost=localhost -Dhttp.proxyPort=3128 -Dsonar.host.url=${SONAR_URL} -Dsonar.login=${SONAR_TOKEN}
		'''
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
