pipeline {
    agent { 
        label 'AGENT-1' 
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    parameters {
        choice(name: 'CHOICE', choices: ['Apply', 'Destroy'], description: 'Pick anyone')
    }

    stages {
        stage('init') {
            steps {
               sh """
               cd 01-vpc
               terraform init -reconfigure
               """
              
            }
        }
        stage('plan') {
            steps {
                sh 'echo this is test stage'
                
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo this is deploy stage'
                
            }
        }
    }
    post { 
        always { 
            echo 'I will always execute'
            deletedir()
        }
        success { 
            echo 'I will execute with success'
        }
        failure { 
            echo 'I will  say Hello with failure!'
        }
    }
}