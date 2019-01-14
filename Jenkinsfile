pipeline {

    agent { 
       docker { 
		image 'mycentos:latest'
		args '-u jenkins -v $HOME/.m2:/home/jenkins/.m2' 
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
        stage('Build and Analyse') {
            steps {
              sh 'mvn clean package sonar:sonar -Dsonar.host.url=$SONAR_HOST'
            }
        }
        stage('Wait') {
            steps {
	      input 'Everything looks ok?'
            }
        }
    }
}
