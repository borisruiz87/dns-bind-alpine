pipeline {
    agent any
    environment {
        GITHUB_CREDS = credentials('token-github')
        HUB_CREDS = credentials('hub-credencial')
        NAME = 'alpine-dns'
        REPO = 'borisruiz87'
        NUMBER = "${env.BUILD_ID}"
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Build the image..'
                sh 'docker build --build-arg TOKEN=$GITHUB_CREDS -t $REPO/$NAME:1.$NUMBER.0 .'
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
                withDockerRegistry(credentialsId: 'hub-credencial', url: '') {
                     sh 'docker push $REPO/$NAME:1.$NUMBER.0'
                }
                
            }
        }
    }
}
