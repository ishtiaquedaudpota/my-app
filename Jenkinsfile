pipeline {

    agent { 
       docker { 
		image '${IMAGE}'
		args  '${ARGS}'
       }
    }

    stages {
        stage('Prepare') {
            steps {
                sh '''
		   git --version
		   mvn --version
		   java -version
		   echo $http_proxy
		   id
		   whoami
		 '''
            }
        }
        stage('Wait') {
            steps {
	      input 'Everything looks ok?'
            }
        }
        stage('Build and Analyse') {
            steps {
              sh 'mvn clean package sonar:sonar -Dsonar.host.url=${SONAR_HOST} -Dsonar.login=${SONAR_TOKEN}'
            }
        }
    }
}
