pipeline {
    agent any

    environment {
        ARM_CLIENT_ID       = credentials('azure-client-id')       // Jenkins credentials ID
        ARM_CLIENT_SECRET   = credentials('azure-client-secret')   // Jenkins credentials ID
        ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id') // Jenkins credentials ID
        ARM_TENANT_ID       = credentials('azure-tenant-id')       // Jenkins credentials ID
    }

    stages {
        stage('Print Azure SPN Details') {
            steps {
                echo "Client ID: ${env.ARM_CLIENT_ID}"
                echo "Tenant ID: ${env.ARM_TENANT_ID}"
                echo "Subscription ID: ${env.ARM_SUBSCRIPTION_ID}"
            }
        }

        stage('Azure Login') {
            steps {
                sh '''
                    az login --service-principal \
                        --username "$ARM_CLIENT_ID" \
                        --password "$ARM_CLIENT_SECRET" \
                        --tenant "$ARM_TENANT_ID"
                    az account set --subscription "$ARM_SUBSCRIPTION_ID"
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan.out'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan.out'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
