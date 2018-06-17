#!groovy

pipeline {
  agent any
  tools {
        maven 'M3'
    }
  stages {
    stage ('Application Build') {
            steps {
                sh 'mvn clean install'                           
            }
            post {
                success { 
                    junit 'target/surefire-reports/**/TEST-*.xml'
                    
                }
               failure {  
                  mail bcc: '', body: "Build Failed", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "gitaau@gmail.com";
              }
            }
      }
    stage ('Docker image build'){
      steps { 
                    sh 'docker build -t gitaau/petclinic-image:latest .'
                    withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]){
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh 'docker push gitaau/petclinic-image:latest'
                    }
      }
    }
    
    }
}
