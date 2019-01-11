pipeline {

    agent { 
       docker { 
		image 'mycentos:latest'
		args '-u jenkins' 
       }

    }

    stages {
        stage('Test') {
            steps {
                sh '''
		   #git --version
		   mvn --version
		   java -version
		   echo $http_proxy
		 '''
            }
        }
        stage('Build') {
            steps {
              sh 'mvn clean package'
            }
        }
    }
}
