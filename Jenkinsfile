pipeline {
    agent any
 
    stages {
       stage('Build') {
          steps {
             docker build . -t 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:v_$BUILD_NUMBER
          }
       }
       stage('Push') {
          steps {
             docker tag 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:v_$BUILD_NUMBER docker tag 755100727753.dkr.ecr.us-east-1.amazonaws.com/time-off:latest
              
          }
       }
       stage('Deploy'){
           steps {
             sh taskDefGenerator
           }
       }
    }
 }
