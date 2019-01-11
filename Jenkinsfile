pipeline {
    agent { 
       docker { 
		image 'mycentos:latest'
		args '-u root -v $HOME/.m2:/root/.m2 -e http_proxy=http://192.168.56.101:3128 -e https_proxy=http://192.168.56.101:3128' 
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
