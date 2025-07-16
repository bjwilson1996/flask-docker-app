pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // Clone your GitHub repo
                git 'https://github.com/bjwilson1996/mini_project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image from flask_app directory
                sh 'docker build -t flask-app ./flask_app'
            }
        }

        stage('Deploy Container') {
            steps {
                // Stop and remove existing container (if any)
                sh 'docker rm -f flask-container || true'

                // Run the new container, mapping port 5000
                sh 'docker run -d -p 5000:5000 --name flask-container flask-app'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
