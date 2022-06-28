#! /bin/bash
for job in $(aws batch list-jobs --job-queue memory --job-status runnable --output text --query "jobSummaryList[*].[jobId]")
do
    echo -ne "Stopping job $job in state $state\t"
    aws batch terminate-job --reason "Terminating job." --job-id $job && echo "Done." || echo "Failed."
done
