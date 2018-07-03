#!/bin/bash

# get most recent databricks spark_version that is not gpu, ml, or beta
# ml depends on operational security package

# maybe use jq regex feature rather than a chain of `not contains`
SPARK_VERSION=$(databricks clusters spark-versions  | jq '.versions[] | select (.key | contains("-gpu-") | not) | select (.key | contains("-ml-") | not) | select (.name | contains("beta") | not) | .key ' | tr -d '"' | sort -u | tail -1)
echo "spark version is: ${SPARK_VERSION}"

# write json file with cluster config
cat << EOF > create-cluster.json
{
  "cluster_name": "from-script",
  "spark_version": "${SPARK_VERSION}",
  "node_type_id": "i3.xlarge",
  "autoscale" :
  {
    "min_workers": 2,
    "max_workers": 4
  }
}
EOF

# create cluster
databricks clusters create --json-file create-cluster.json
