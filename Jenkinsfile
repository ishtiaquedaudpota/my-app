pipeline {
    agent { 
       docker { 
		image 'mycentos:latest'
		args '-u root -v $HOME/.m2:/root/.m2 -e http_proxy=${PROXY} -e https_proxy=${PROXY}' 
       }

    }

    stages {
        stage('Test') {
            steps {
                sh '''
		   #git --version
		   mvn --version
		   java -version
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
