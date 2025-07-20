pipeline {
  agent any

  environment {
    ARM_CLIENT_ID        = credentials('ARM_CLIENT_ID')     // Jenkins credentials ID
    ARM_CLIENT_SECRET    = credentials('ARM_CLIENT_SECRET')
    ARM_SUBSCRIPTION_ID  = credentials('ARM_SUBSCRIPTION_ID')
    ARM_TENANT_ID        = credentials('ARM_TENANT_ID')
  }

  stages {
    stage('Terraform Init') {
      steps {
        sh '''
          export ARM_CLIENT_ID=$ARM_CLIENT_ID
          export ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET
          export ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID
          export ARM_TENANT_ID=$ARM_TENANT_ID
          terraform init
        '''
      }
    }

    stage('Terraform Plan') {
      steps {
        sh '''
          export ARM_CLIENT_ID=$ARM_CLIENT_ID
          export ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET
          export ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID
          export ARM_TENANT_ID=$ARM_TENANT_ID
          terraform plan -var-file="terraform.tfvars"
        '''
      }
    }
  }
}
