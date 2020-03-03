pipeline {
    agent any
 
    stages {
        stage('Prep Environment') {
            steps{
                echo "Log in to ECR"
                sh "whoami"
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 755100727753.dkr.ecr.us-east-1.amazonaws.com"
                echo "Removing old Docker Images"
                sh "docker prune -a -f"
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
                sh "taskDefGenerator"
            }
        }
    }
}
