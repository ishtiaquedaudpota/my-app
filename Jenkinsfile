pipeline {
    agent { 
       docker { image 'mycentos:latest' }
    }

    stages {
        stage('Test') {
            steps {
                sh '''
		   git --version
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
