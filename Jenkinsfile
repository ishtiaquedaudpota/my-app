pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v $HOME/.m2:/root/.m2 -e http_proxy=${PROXY_URL} -e https_proxy=${PROXY_URL}'
        }
    }
    stages {
	stage ('Start Sonarqube') {
	   steps { sh './sonar-run.sh start' }
	}
	stage('Build') {
            steps {
                sh '''
		    mvn clean package sonar:sonar -Dsonar.host.url=${SONAR_URL} -Dsonar.login=${SONAR_TOKEN}
		'''
            }
        }
    }
     post {
     	   always {
        	sonar-run.sh stop
            	deleteDir()
           }
     }
}
