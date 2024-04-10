pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    environment {
        registry = "161179166305.dkr.ecr.us-east-1.amazonaws.com/navitas-spring-boot-2"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rahultummala90/navitas-spring-boot-2']])
            }
        }

        stage ('Build Jar') {
            steps {
                sh "mvn clean install"
            }

        }

        stage ("Build Image") {
            steps {
                script {
                    docker.build registry
                }
            }
        }

        stage ("Push Into ECR") {
            steps {
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 161179166305.dkr.ecr.us-east-1.amazonaws.com"
                sh "docker push 161179166305.dkr.ecr.us-east-1.amazonaws.com/navitas-spring-boot-2:latest"
            }
        }

        stage ("K8S Deploy") {
            steps {
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'K8S', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                    sh "kubectl apply -f eks-deploy-k8s.yaml"
                }
            }
        }

    }
}