pipeline {
    agent any
 
    stages {
        stage('Build') {
            steps{
                sh "pwd"
                sh "ls"
                sh "docker build time-off ."
            }
        }
        stage('Push') {
            steps {
                sh "docker tag time-off:latest 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:v_$BUILD_NUMBER 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:latest"
                sh "docker push 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:latest"
            }
        }
        stage('Deploy'){
            steps {
                sh "taskDefGenerator"
            }
        }
    }
}
