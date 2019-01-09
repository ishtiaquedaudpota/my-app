pipeline {
    agent { 
       docker { image 'mycentos:latest' }
    }

    stages {
        stage('Test') {
            steps {
                sh '''
		   id
		   whoami
		   pwd
		 '''
            }
        }
        stage('Build') {
            steps {
              sh 'mvn -v'
            }
        }
    }
}
