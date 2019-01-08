pipeline {
    agent {
        docker { image 'sonarqube:lts' }
    }

    tools { maven 'Maven 3.5.4' }

    stages {
	stage('Test') {
	    steps { sh 'ls -l /opt/sonarqube' }	
	}
    }
}
