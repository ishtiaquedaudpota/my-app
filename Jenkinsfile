node {
    docker.image('mycento:latest') {
        stage('Prepare') {
           sh '''
              git --version
              mvn --version
              java -version
           '''
        }
        stage('Build') {
           sh 'mvn package'
        }
    }
}
