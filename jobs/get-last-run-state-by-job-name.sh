#!/bin/bash
set -euo pipefail

# json output provides detail
# getting job id by name is easier with the TABLE output
# this is intended as an extensible example

JOB_NAME="First-test-job"
echo "JOB_NAME is ${JOB_NAME}"
# example of how to use shell variable interpolation in jq query

JOB_ID=$(databricks jobs list --output JSON | jq ".jobs[] | select(.settings.name == \"${JOB_NAME}\") | .job_id")
echo "JOB_ID is ${JOB_ID}"

LAST_RUN_STATE=$(databricks runs list --output JSON --job-id $JOB_ID  | jq '.runs[0].state.result_state')
echo "last run state is ${LAST_RUN_STATE}"
