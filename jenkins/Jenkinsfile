pipeline {
  agent any

  environment {
    ARM_CLIENT_ID        = credentials('ARM_CLIENT_ID')
    ARM_CLIENT_SECRET    = credentials('ARM_CLIENT_SECRET')
    ARM_SUBSCRIPTION_ID  = credentials('ARM_SUBSCRIPTION_ID')
    ARM_TENANT_ID        = credentials('ARM_TENANT_ID')
  }

  stages {
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -var-file="terraform.tfvars"'
      }
    }
  }
}
