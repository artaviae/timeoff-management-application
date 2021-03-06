#!/bin/bash
SERVICE_NAME="time-off-service"
IMAGE_VERSION="v_"${BUILD_NUMBER}
TASK_FAMILY="time-off"


# Create a new task definition for this build
sed -e "s;%BUILD_NUMBER%;${BUILD_NUMBER};g" time-off.json > time-off-v_${BUILD_NUMBER}.json
aws ecs register-task-definition --family time-off --cli-input-json file://time-off-v_${BUILD_NUMBER}.json

# Update the service with the new task definition and desired count
TASK_REVISION=`aws ecs describe-task-definition --task-definition time-off | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//'`
DESIRED_COUNT=`aws ecs describe-services --services ${SERVICE_NAME} | egrep "desiredCount" | tr "/" " " | awk '{print $2}' | sed 's/,$//'`
if [ ${DESIRED_COUNT} = "0" ]; then
    DESIRED_COUNT="1"
fi

aws ecs update-service --cluster default --service ${SERVICE_NAME} --task-definition ${TASK_FAMILY}:${TASK_REVISION} --desired-count ${DESIRED_COUNT}