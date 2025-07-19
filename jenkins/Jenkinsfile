pipeline {
    agent any

    environment {
        ARM_CLIENT_ID       = '1dd4c0fc-ba75-4d2d-a63d-c68ff09aac64'
        ARM_CLIENT_SECRET   = 'rP.8Q~kscGvzHyyeDz6ALVL6Bf13NmaKKcMNCaAr'
        ARM_SUBSCRIPTION_ID = '4d5852fb-ad3c-41ce-9fd9-3527965dfd6d'
        ARM_TENANT_ID       = '465caf12-973f-460b-a449-88a813dee2ba'
    }

    stages {
        stage('Show Azure Environment Variables') {
            steps {
                sh '''
                    echo "Client ID: $ARM_CLIENT_ID"
                    echo "Tenant ID: $ARM_TENANT_ID"
                    echo "Subscription ID: $ARM_SUBSCRIPTION_ID"
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
}

