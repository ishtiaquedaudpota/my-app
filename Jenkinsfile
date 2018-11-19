pipeline {
    agent none
    stages {
        stage("Postgres") {
            agent {
                docker {
                    image 'postgres'                    
                    label 'postgres'
		}
	    }
	    steps { sh 'psql --version ' }
        }
        stage('wait') {
            steps {
                input "Does the staging environment look ok?"
            }
        }
    }
}
