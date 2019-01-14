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
        stage('Build') {
            steps {
              sh 'mvn clean package'
            }
        }
	stage('Analyse') {
             steps {
                sh '''
                   ## 3) build webcms plugins
                   mvn sonar:sonar -Dsonar.url=${params.SONAR_HOST} -Dsonar.login=${params.SONAR_TOKEN}
                '''
              }
        }
        stage('Wait') {
            steps {
	      input 'Everything looks ok?'
            }
        }
    }
}
