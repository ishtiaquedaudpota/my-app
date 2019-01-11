pipeline {

    agent { 
       docker { 
		image 'mycentos:latest'
		args '-u jenkins -v $HOME/.m2:$HOME/.m2' 
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
        stage('Build') {
            steps {
              sh 'mvn clean package'
            }
        }
        stage('Wait') {
            steps {
	      input 'Everything looks ok?'
            }
        }
    }
}
