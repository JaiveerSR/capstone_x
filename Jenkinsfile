pipeline {
    agent any
    triggers {
        githubPush()  // This triggers the job when a push is made to GitHub
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git url: 'https://github.com/JaiveerSR/capstone_x.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image for your Python code
                    sh 'docker build -t capstone-image .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove the existing container, if running
                    sh '''
                    docker stop capstone-container || true
                    docker rm capstone-container || true
                    '''
                    
                    // Run the new Docker container
                    sh 'docker run -d --name capstone-container capstone-image'
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
