pipeline {
    agent any 

    environment {
        SCRIPT_NAME = 'apache.sh'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Pulls the script from your GitHub repo into the Jenkins workspace
                checkout scm
            }
        }

        stage('Prepare Script') {
            steps {
                // Changes file permissions inside the local workspace
                sh "chmod +x ./${SCRIPT_NAME}"
            }
        }

        stage('Execute Apache Installation') {
            steps {
                // Runs locally on the machine using the sudo rule we just added
                sh "sudo ./${SCRIPT_NAME}"
            }
        }
    }
}
