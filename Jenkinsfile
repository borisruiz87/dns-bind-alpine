pipeline {
    agent any
    environment {
        GITHUB_CREDS = credentials('token-github')
        NAME = 'alpine-dns'
        REPO = 'borisruiz87'
        TAG = ${env.BUILD_TAG}
        NUMBER = ${env.BUILD_ID}
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Build the image..'
                sh 'docker build --build-arg TOKEN=$GITHUB_CREDS -t $REPO/$NAME:$TAG .'
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
        stage('Deploy') {
            steps {
                echo '$NUMBER'
            }
        }
    }
}
