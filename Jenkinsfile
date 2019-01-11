pipeline {

    agent { 
       docker { 
		image 'mycentos:latest'
		args '-u root -e http_proxy=http://192.168.56.101:3128 -e https_proxy=http://192.168.56.101:3128' 
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
