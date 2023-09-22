pipeline {
    agent any

        environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {
        
       
        stage('Docker Build') {
            steps {
                sh "docker build . -t sabair0509/hiring-app:$BUILD_NUMBER"
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'hubPwd')]) {
                    sh "docker login -u sabair0509 -p ${hubPwd}"
                    sh "docker push sabair0509/hiring-app:$BUILD_NUMBER"
                }
            }
        }
        stage('Checkout K8S manifest SCM'){
            steps {
              git branch: 'main', url: 'https://github.com/betawins/Hiring-app-argocd.git'
            }
        } 
        stage('Update K8S manifest & push to Repo'){
            steps {
                script{
                        sh '''
                        cat /dev/deployment.yaml
                        sed -i '' "s/32/${BUILD_NUMBER}/g" /dev/deployment.yaml
                        cat deploy.yaml
                        git add deploy.yaml
                        git commit -m 'Updated the deploy yaml | Jenkins Pipeline'
                        git remote -v
                        git push https://github.com/betawins/Hiring-app-argocd.git HEAD:main
                        '''                        
                      }
                  }
            }   
        }
            } 
