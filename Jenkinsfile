pipeline {

    agent { 
       docker { 
		image 'mycentos:latest'
		args '-u root -e http_proxy="${params.PROXY}" -e https_proxy="${params.PROXY}"' 
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
