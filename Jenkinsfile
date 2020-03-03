pipeline {
    agent any
 
    stages {
        stage('Prep Environment') {
            steps{
                echo "Log in to ECR"
                sh "\$(aws ecr get-login --no-include-email --region us-east-1)"
                echo "Cleaning Docker Environment"
                sh "docker container prune -f"
                sh "docker image prune -a -f"
                sh "pwd"
                sh "mkdir -p /var/lib/jenkins/workspace/timeoff/test"
                sh "cp ./Dockerfile ./test/" 
                sh "cd test"
                sh "pwd"
            }
        }        
        stage('Build') {
            steps{
                echo "Building image"
                sh "docker build --tag 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:v_$BUILD_NUMBER ."
            }
        }
        stage('Push') {
            steps {
                echo "Tagging Image"
                sh "docker tag 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:v_$BUILD_NUMBER 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:latest"
                echo "Push Image" 
                sh "docker push 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:latest"
            }
        }
        stage('Deploy'){
            steps {
                echo "Generating new Task Definition and updating Service"
                sh "../taskDefGenerator"
            }
        }
    }
}
