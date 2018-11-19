pipeline {
    agent none
    stages {
        stage("Postgres") {
            agent {
                docker {
                    image 'postgres'                    
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
