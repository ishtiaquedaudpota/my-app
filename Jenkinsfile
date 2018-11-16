pipeline {
    agent {
        docker { image 'postgres' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'psql --version'
            }
        }
    }
}
