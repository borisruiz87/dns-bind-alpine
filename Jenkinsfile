pipeline {
    agent any
    environment {
        GITHUB_CREDS = credentials('token-github')
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Build the image..'
                sh 'docker build --build-arg TOKEN=$GITHUB_CREDS -t alpine-dns-auth:test-jenkins .'
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
                echo 'Deploying....'
            }
        }
    }
}
