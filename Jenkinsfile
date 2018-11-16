pipeline {
    agent {
        docker {
           image 'sonarqube'
           args '--name sonarqube -p 9000:9000 -e SONARQUBE_JDBC_USERNAME=sonar -e SONARQUBE_JDBC_PASSWORD=sonar -e SONARQUBE_JDBC_URL=jdbc:postgresql://postgres:5432/sonar -d --net mynet'
        }
	    docker {
           image 'sonarqube'
           args '--name sonarqube -p 9000:9000 -e SONARQUBE_JDBC_USERNAME=sonar -e SONARQUBE_JDBC_PASSWORD=sonar -e SONARQUBE_JDBC_URL=jdbc:postgresql://postgres:5432/sonar -d --net mynet'
        }	
    }
    stages {
        stage('wait') {
                steps {
                    input "Does the staging environment look ok?"
                }
        }
    }
}
