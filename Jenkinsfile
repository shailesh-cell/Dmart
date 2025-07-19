pipeline {
    agent any

    environment {
        ARM_CLIENT_ID = credentials('jenkins-arm-client-id')
        ARM_CLIENT_SECRET = credentials('jenkins-arm-client-secret')
        ARM_SUBSCRIPTION_ID = credentials('jenkins-arm-subscription-id')
        ARM_TENANT_ID = credentials('jenkins-arm-tenant-id')
    }

    stages {
        stage('Print Azure Credentials') {
            steps {
                echo "Client ID: ${env.ARM_CLIENT_ID}"
                echo "Tenant ID: ${env.ARM_TENANT_ID}"
                echo "Subscription ID: ${env.ARM_SUBSCRIPTION_ID}"
            }
        }

        stage('Azure Login') {
            steps {
                sh '''
                    set -ex
                    az login --service-principal \
                        --username "$ARM_CLIENT_ID" \
                        --password "$ARM_CLIENT_SECRET" \
                        --tenant "$ARM_TENANT_ID"
                    
                    az account set --subscription "$ARM_SUBSCRIPTION_ID"
                    az account show
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    sh '''
                        set -ex
                        terraform init
                        echo "Terraform Init Exit Code: $?"
                    '''
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    sh '''
                        set -ex
                        terraform validate
                        echo "Terraform Validate Exit Code: $?"
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    sh '''
                        set -ex
                        terraform plan -out=tfplan.out
                        echo "Terraform Plan Exit Code: $?"
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve to Apply Terraform Changes?'
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    sh '''
                        set -ex
                        terraform apply -auto-approve tfplan.out
                        echo "Terraform Apply Exit Code: $?"
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Terraform Pipeline Completed Successfully!'
        }
        failure {
            echo '❌ Pipeline failed! Check the above logs.'
        }
        always {
            echo '📦 Pipeline finished.'
        }
    }
}

