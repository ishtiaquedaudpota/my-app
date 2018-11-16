pipeline {
    agent any
    stages {
        stage('Build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    withMaven(maven:'Maven') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
