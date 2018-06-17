#!groovy

pipeline {
  agent none
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
            }
        }
    stage('Docker Image Build') {
      agent any
      steps {
        sh 'docker build -t gitaau/spring-petclinic:latest .'
      }
    }
  }
}      
