pipeline {
    agent any
    environment {
        GITHUB_CREDS = credentials('token-github')
        HUB_CREDS = credentials('hub-credencial')
        NAME = 'alpine-dns'
        REPO = 'borisruiz87'
        NUMBER = "${env.BUILD_ID}-${env.GIT_REVISION}"
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Build the image..'
                def dockerImage = docker.build '--build-arg TOKEN=$GITHUB_CREDS -t $REPO/$NAME:1.$NUMBER .'
            }
        }
        stage('Test') {
            when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
            steps {
                echo 'Testing the image created..'
                sh 'docker images'
            }
        }
        stage('Push') {
            steps {
                withDockerRegistry(credentialsId: 'hub-credencial', url: '') {
                     dockerImage.push()
                }
                
            }
        }
        stage('Clean') {
            steps {
                echo 'Cleaning the image..'
                 sh 'docker image rm $REPO/$NAME:1.$NUMBER'
            }
        }
    }
}
