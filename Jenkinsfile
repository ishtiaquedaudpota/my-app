pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage('Build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarServer') {
                   sh 'mvn clean package sonar:sonar'
                }
            }
        }
    }
}
