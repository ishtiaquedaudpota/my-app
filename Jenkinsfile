pipeline {
    agent {
        docker {
            image 'mymaven:latest'
            args '-v $HOME/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                   id
                   pwd
                   maven clean package
                ''' 
            }
        }
    }
}
