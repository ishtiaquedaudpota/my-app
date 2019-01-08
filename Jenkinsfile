pipeline {
    agent {
        docker { image 'ishtiaquedaudpota/sonarqube:latest' }
    }

    tools { maven 'Maven' }

    stages {
        stage('Verify') {
           steps { sh 'mvn clean verify sonar:sonar' }
        }
        stage('Build') {
           steps { sh 'mvn clean install' }
        }
        stage('Analyse') {
           steps { sh 'mvn sonar:sonar' }
        }
        stage('Wait') {
           steps { input "Does the staging environment look ok?" }
        }
    }
}
