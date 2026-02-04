pipeline {
    agent any

    tools {
        nodejs 'node-18'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main' , url: 'https://github.com/LloydLim1/dummyTribe-frontend.git'
            }
        }

    stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo 'Running Frontend Tests...'
                bat 'npm test'
            }
        }

        stage('Build') {
            steps {
                echo 'Building React App...'
                // This creates the "dist" folder with your actual website files
                bat 'npm run build'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running Unit Tests...'
                // React/Vite creates a placeholder test script, so this might fail if we run it now.
                // We will skip actual testing for this specific moment.
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Frontend Container...'
                // Notice we named it 'frontend-app' this time
                bat 'docker build -t frontend-app .'
            }
        }
    }
}