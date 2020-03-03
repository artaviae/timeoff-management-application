pipeline {
    agent any
 
    stages {
        stage('Build') {
            steps{
                pwd
                ls
            }
        }
        stage('Push') {
            steps {
                #docker tag time-off:latest 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:v_$BUILD_NUMBER 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:latest
                #docker push 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:latest 
            }
        }
        stage('Deploy'){
            steps {
                #sh taskDefGenerator
            }
        }
    }
}
