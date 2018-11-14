pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                timeout(time: 1, unit: 'MINUTES') {
                    retry(3) {
                        sh './flakey-deploy.sh'
                    }
                }
            }
        }
    }
}
