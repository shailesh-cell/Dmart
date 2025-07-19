pipeline {
    agent any

    environment {
        ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id')
        ARM_CLIENT_ID       = credentials('azure-client-id')
        ARM_CLIENT_SECRET   = credentials('azure-client-secret')
        ARM_TENANT_ID       = credentials('azure-tenant-id')
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan \
                  -var "subscription_id=$ARM_SUBSCRIPTION_ID" \
                  -var "client_id=$ARM_CLIENT_ID" \
                  -var "client_secret=$ARM_CLIENT_SECRET" \
                  -var "tenant_id=$ARM_TENANT_ID"
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                terraform apply -auto-approve \
                  -var "subscription_id=$ARM_SUBSCRIPTION_ID" \
                  -var "client_id=$ARM_CLIENT_ID" \
                  -var "client_secret=$ARM_CLIENT_SECRET" \
                  -var "tenant_id=$ARM_TENANT_ID"
                '''
            }
        }
    }
}
