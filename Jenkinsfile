pipeline {
    agent none
    stages {
        stage("Postgres") {
            agent {
                docker {
                    image 'postgres'                    
                    args '--name postgres -e POSTGRES_USER=sonar -e POSTGRES_PASSWORD=sonar -d -p 5432:5432 --net mynet postgres'
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
