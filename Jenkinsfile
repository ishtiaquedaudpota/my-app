pipeline {
    agent any
    tools {
        maven 'maven'
        jdk 'java'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }

        stage ('Analyse') {
            steps {
              sh 'mvn sonar:sonar -Dsonar.host.url=http://192.168.56.101:9000 -Dsonar.login=8d0f68f61c197098070494aa0ab186be71b9260f'
            }
        }
    }
}
