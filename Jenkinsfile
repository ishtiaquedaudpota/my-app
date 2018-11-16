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
        stage ('Package') {
            steps {
              sh 'mvn package'
            }
        }
        stage ('Analyse') {
            steps {
              sh 'mvn sonar:sonar'
            }
        }
    }
}
