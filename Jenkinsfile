pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
                git url: 'https://github.com/ishtiaquedaudpota/my-app.git'
            }
        }
        stage('Build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarServer') {
                    withMaven(maven:'Maven') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
