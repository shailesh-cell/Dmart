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

    stage('Security Scan - tfsec') {
      steps {
        sh 'tfsec .'
      }
    }

    stage('Security Scan - Trivy') {
      steps {
        sh 'trivy config .'
      }
    }

    stage('Approve Apply') {
      steps {
        input message: 'Do you want to APPLY the Terraform changes?'
      }
    }

    stage('Terraform Apply') {
      steps {
        sh 'terraform apply -var-file="terraform.tfvars" -auto-approve'
      }
    }

    stage('Destroy Approval') {
      steps {
        input message: 'Destroy resources?'
      }
    }

    stage('Terraform Destroy') {
      steps {
        sh 'terraform destroy -var-file="terraform.tfvars" -auto-approve'
      }
    }
  }
}
