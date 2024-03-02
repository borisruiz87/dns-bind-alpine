pipeline {
    agent any
    environment {
        GITHUB_CREDS = credentials('token-github')
        HUB_CREDS = credentials('hub-credencial')
        NAME = 'gitops-test'
        REPO = 'borisruiz87'
        NUMBER = "${env.BUILD_ID}-${env.GIT_COMMIT}"
        dockerImage = ''
    }
    
    stages {
        stage('Build') {
            steps {
                echo 'Build the image..'
                script {
                    dockerImage = docker.build "$REPO/$NAME:1.$NUMBER"
                }
                
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
                script {
                   withDockerRegistry(credentialsId: 'hub-credencial', url: '') {
                        dockerImage.push()
                   }
                }
                
            }
        }
        stage('Clean') {
            steps {
                echo 'Cleaning the image..'
                 sh 'docker image rm $REPO/$NAME:1.$NUMBER'
            }
        }
        stage("Clone Git Repository para GitOps") {
            steps {
                git(
                    url: "https://github.com/borisruiz87/argocd-test.git",
                    branch: "main",
                    changelog: true,
                    poll: true
                )
            }
        }
        stage("Hacer el cambio en el manifiesto") {
            steps {
                sh 'git config --global user.name "Boris Ruiz"'
                sh 'git config --global user.email borisruiz87@gmail.com'
                dir("manifest"){
                    sh 'sed -i "s#$REPO/$NAME.*#$REPO/$NAME:1.$NUMBER#g" dns-deployment.yaml' 
                }
                sh "git add ."
                sh "git commit -m 'Add news commit from Jenkins'"
            }
        }
        stage("Push to Git Repository") {
            steps {
                withCredentials([string(credentialsId: 'token-github', variable: 'TOKEN')]) {
                    sh "git push -u https://${TOKEN}:@github.com/borisruiz87/argocd-test.git main"
                }
            }
        }
    }
    post {
        always {
            deleteDir()
        }
    }
}
