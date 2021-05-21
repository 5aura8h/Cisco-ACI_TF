pipeline {
    agent none

    parameters {
        choice(
            choices: ['plan' , 'apply' , 'show', 'preview-destroy' , 'destroy'],
            description: 'Terraform action to apply',
            name: 'action')
        
    }
    stages {
        
        stage('checkout') {
        agent {
              label 'master'
          }
        steps {
          git branch: 'main',
              url: 'https://github.com/5aura8h/jenkins.git'
        }
      }
    
        stage('init') {
            agent {
              label 'mac'
            }
            steps {
                sh 'terraform version'
                sh 'terraform init'
            }
        }
        stage('validate') {
            agent {
              label 'mac'
            }

            when {
                expression { params.action == 'plan' || params.action == 'apply' || params.action == 'destroy' }
            }
            steps {
                sh 'terraform validate'
            }
        }
        stage('plan') {
            
            agent {
              label 'mac'
            }

            when {
                expression { params.action == 'plan' }
            }
            steps {
                sh 'terraform plan'
            }
        }
        stage('APPROVE') {
            when {
                expression { params.action == 'apply' || params.action == 'destroy' }
            }
        steps {
          script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
          }
        }
      }
        stage('apply') {
            agent {
              label 'mac'
            }
            when {
                expression { params.action == 'apply' }
            }
            steps {
                sh 'terraform plan -out=plan'
                sh 'terraform apply -auto-approve plan'
            }
        }
        stage('show') {
            agent {
              label 'mac'
            }
            when {
                expression { params.action == 'show' }
            }
            steps {
                sh 'terraform show'
            }
        }
        stage('preview-destroy') {
            agent {
              label 'mac'
            }
            when {
                expression { params.action == 'preview-destroy' }
            }
            steps {
                sh 'terraform plan'
            }
        }
        stage('destroy') {
            agent {
              label 'mac'
            }
            when {
                expression { params.action == 'destroy' }
            }
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
