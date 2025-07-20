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

    stage('Approve Terraform Apply') {
      steps {
        script {
          input message: 'Do you want to apply Terraform changes?', ok: 'Yes, apply'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        sh '''
          export ARM_CLIENT_ID=$ARM_CLIENT_ID
          export ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET
          export ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID
          export ARM_TENANT_ID=$ARM_TENANT_ID
          terraform apply -auto-approve -var-file="terraform.tfvars"
        '''
      }
    }

    stage('Approve Terraform Destroy') {
      steps {
        script {
          input message: 'Do you want to destroy Terraform resources?', ok: 'Yes, destroy'
        }
      }
    }

    stage('Terraform Destroy') {
      steps {
        sh '''
          export ARM_CLIENT_ID=$ARM_CLIENT_ID
          export ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET
          export ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID
          export ARM_TENANT_ID=$ARM_TENANT_ID
          terraform destroy -auto-approve -var-file="terraform.tfvars"
        '''
      }
    }
  }
}

