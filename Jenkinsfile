pipeline {
    agent none
    stages {
        stage('Back-end') {
            agent {
                docker { image 'maven:3-alpine' }
            }
        }
        stage('Front-end') {
            agent {
                docker { image 'node:7-alpine' }
            }
        }
    }
}
