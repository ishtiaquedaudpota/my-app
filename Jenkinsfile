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
		}
		stage("Sonarqube") {
			agent {
				docker {
           				image 'sonarqube'
           				args '--name sonarqube -p 9000:9000 -e SONARQUBE_JDBC_USERNAME=sonar -e SONARQUBE_JDBC_PASSWORD=sonar -e SONARQUBE_JDBC_URL=jdbc:postgresql://postgres:5432/sonar -d --net mynet sonarqube'
        			}
			}
		}
        	stage('wait') {
                	steps {
                    		input "Does the staging environment look ok?"
                	}
        	}
    	}
}
