pipeline {
    agent {
        docker {
            image 'mycentos:latest'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                   id
                   pwd
		   echo $http_proxy
		   echo $https_proxy
                   mvn clean package
                ''' 
            }
        }
    }
}
