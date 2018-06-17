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
                  mail bcc: '', body: "<b>Example</b><br>\n\<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "gitaau@gmail.com";
              }
            }
        }
    stage('Docker Image Build') {
      agent any
      steps {
        sh 'docker build -t gitaau/spring-petclinic:latest $WORKSPACE/.'
      }
    }
  }
}      
