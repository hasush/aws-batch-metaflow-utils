#! /bin/bash
for job in $(aws batch list-jobs --job-queue memory --job-status runnable --output text --query "jobSummaryList[*].[jobId]")
do
    echo -ne "Stopping job $job in state $state\t"
    aws batch terminate-job --reason "Terminating job." --job-id $job && echo "Done." || echo "Failed."
done

# aws stepfunctions list-executions \
#   --state-machine-arn arn:aws:states:us-east-1:786346568665:stateMachine:listing_fraud_detection.user.yash.FraudDetectionGatorInferen-uthdthcqnejerriz \
#   --status-filter RUNNING \
#   --query "executions[*].{executionArn:executionArn}" \
#   --output text | \
# xargs -I {} aws stepfunctions stop-execution \
#   --execution-arn {} 
