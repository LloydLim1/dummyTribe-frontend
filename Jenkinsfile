pipeline {
    agent any
    
    tools {
        // Ensure this matches your Jenkins Global Tool Configuration
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
                // Vitest usually runs in watch mode by default, so we add --run to run it once
                bat 'npm run test -- --run' 
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar-scanner'
                    withSonarQubeEnv('sonar-server') {
                        // Scan the src folder for the frontend project
                        bat "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=frontend-repo -Dsonar.sources=src"
                    }
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t frontend-app .'
            }
        }
    }
}