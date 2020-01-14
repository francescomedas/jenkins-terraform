#!/usr/bin/env groovy

env.docker_tag = "localtest-${BUILD_NUMBER}"

node() {
  timestamps {
    ansiColor('xterm') {
      withCredentials([
          usernamePassword(credentialsId: "aws_credentials", usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY'),
      ]){
        try {

          stage('Create environment') {
            deleteDir()
            checkout scm
            sh 'make container-run'
          }

          stage('Run terraform') {
            sh "docker exec -t ${docker_tag} /bin/bash -c 'cd /srv/example; make all'"
          }

        } catch (err) {
          throw (err)
        } finally {
          stage('Remove environment') {
            sh "make container-clean"
          }
        }
      }
    }
  }
}
