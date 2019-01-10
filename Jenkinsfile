pipeline {
    agent {
        docker {
            image 'mycentos:latest'
            args '-u jenkins -v $HOME/.m2:/root/.m2 -e http_proxy=http://192.168.56.101:3128 -e https_proxy=http://192.168.56.101:3128'
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
	           echo $HOME
                   mvn clean package
                ''' 
            }
        }
    }
}
