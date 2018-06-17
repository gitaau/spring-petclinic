#!groovy

pipeline {
  agent {
    label 'master'
  }
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
    stage('Docker Image Build') {
      agent any
      steps {
        sh 'docker build -t gitaau/spring-petclinic:latest $WORKSPACE/.'
      }
    }
  }
}      
