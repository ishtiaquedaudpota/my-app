pipeline {
    environment {
  	HTTPS_PROXY = '${params.PROXY}'
  	HTTP_PROXY = '${params.PROXY}'
  	PROXY_ENABLED = 'TRUE'
    }

    agent { 
       docker { 
		image 'mycentos:latest'
		args '-u root -e http_proxy=$HTTP_PROXY -e https_proxy=$HTTP_PROXY' 
       }

    }

    stages {
        stage('Test') {
            steps {
                sh '''
		   #git --version
		   mvn --version
		   java -version
		   echo ${PROXY}
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
