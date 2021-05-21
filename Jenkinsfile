pipeline {
    agent any
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "aci_terraform"
    }
    stages {

    
        stage('Terraform Init'){
            steps {
                
                    
                    sh 'terraform init'
        }
    }
    stage('Terraform Plan'){
            steps {
                
                    
                    sh 'terraform plan'
        }
    }
    stage('Terraform Apply'){
            steps {
                
                    
                    sh 'terraform apply -auto-approve'
        
    }
    }
}
}
