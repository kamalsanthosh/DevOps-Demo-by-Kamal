pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git(
                    branch: 'main',
                    credentialsId: 'github-ssh',
                    url: 'git@github.com:kamalsanthosh/DevOps-Demo-by-Kamal.git'
                )
            }
        }

        stage('Build') {
            steps {
                echo "Build stage running..."
            }
        }

        stage('Test') {
            steps {
                echo "Test stage running..."
            }
        }

        stage('Package Docker Image') {
            steps {
                echo "Docker build stage running..."
            }
        }
    }
}
