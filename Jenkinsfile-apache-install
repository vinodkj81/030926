pipeline {
    agent any 

    environment {
        // Updated to match your exact filename on GitHub
        SCRIPT_NAME = 'install-apache.sh'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Prepare Script') {
            steps {
                sh "chmod +x ./${SCRIPT_NAME}"
            }
        }

        stage('Execute Apache Installation') {
            steps {
                sh "sudo ./${SCRIPT_NAME}"
            }
        }
    }
}
