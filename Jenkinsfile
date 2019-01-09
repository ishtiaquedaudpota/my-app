node {
   stage('Build') {
        app = docker.build("mycentos:latest")
        app.inside { sh 'mvn -v' } 
   }
}
