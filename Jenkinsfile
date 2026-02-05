pipeline {
    agent any
    
    tools {
        nodejs 'node-18' 
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/LloydLim1/dummyTribe-frontend.git'
            }
        }
        
        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Run Unit Tests') {
            steps {
                // Ensure Vitest runs once and exits
                bat 'npm run test -- --run' 
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar-scanner'
                    withSonarQubeEnv('sonar-server') {
                        bat "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=frontend-repo -Dsonar.sources=src"
                    }
                }
            }
        }
        
        stage('Build & Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('', 'docker-hub-credentials') {
                        // Build and Push the Frontend Image
                        bat 'docker build -t lloydlim10/dummy-frontend:latest .'
                        bat 'docker push lloydlim10/dummy-frontend:latest'
                    }
                }
            }
        }
    }
}