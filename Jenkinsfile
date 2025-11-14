pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url:  'git@github.com:kamalsanthosh/DevOps-Demo-by-Kamal.git'
                    credentialsId: 'github-ssh'
            }
        }

        stage('Build') {
            steps {
                echo "Building the project..."
                sh 'echo "Simulating build..."'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'echo "Tests successful!"'
            }
        }

        stage('Package Docker Image') {
            steps {
                echo "Building Docker image..."
                sh '''
                docker build -t myapp:latest .
                docker tag myapp:latest <aws_account_id>.dkr.ecr.<region>.amazonaws.com/myapp:latest
                '''
            }
        }
    }
}
