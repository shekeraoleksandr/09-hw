pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code from GitHub"
                checkout scm
            }
        }
        stage('Cleanup Apache') {
            steps {
                sh './scripts/clenup-apache.sh'
            }
        }
        stage('Install Apache') {
            steps {
                sh './scripts/install-apache.sh'
            }
        }
        stage('Verify Installation') {
            steps {
                sh './scripts/verify-installation.sh'
            }
        }
        stage('Generate Test Traffic') {
            steps {
                sh './scripts/generate-traffic.sh'
            }
        }
        stage('Check Logs for Errors') {
           steps {
                sh './scripts/check-logs.sh'
            }     
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Check logs for details."
        }
    }
}
