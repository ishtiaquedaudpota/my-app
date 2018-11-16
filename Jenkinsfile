pipeline {
    agent {
        docker {
           image 'postgres'
	   args '--name postgres -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -d -p 5432:5432'
	}
    }
    
    stages {
        stage('Test') {
            steps {
                sh 'psql --version'
            }
        }
    	stage('heck') {
        	steps {
                    input "Does the staging environment look ok?"
        	}
    	}
    }
}
