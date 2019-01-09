node {
   stage('Prepare') {
        app = docker.build("mycentos:latest")
   }
   stage('Build') {
        app.inside { sh 'mvn clean package' }
   }
}
