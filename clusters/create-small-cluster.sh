#!/bin/bash
set -euo pipefail

# get most recent databricks spark_version that is not gpu, ml, or beta

# maybe use jq regex feature rather than a chain of `not contains`
SPARK_VERSION=$(databricks clusters spark-versions  | jq '.versions[] | select (.key | contains("-gpu-") | not) | select (.key | contains("-ml-") | not) | select (.name | contains("beta") | not) | .key ' | tr -d '"' | sort -u | tail -1)
echo "spark version is: ${SPARK_VERSION}"

# write json file with cluster config
cat << EOF > create-cluster.json
{
    "num_workers": 2,
    "cluster_name": "mikes-small-cluster",
    "spark_version": "${SPARK_VERSION}",
    "spark_conf": {},
    "aws_attributes": {
        "first_on_demand": 1,
        "availability": "SPOT_WITH_FALLBACK",
        "zone_id": "",
        "instance_profile_arn": "arn:aws:iam::899258260415:instance-profile/zignal-databricks2",
        "spot_bid_price_percent": 100,
        "ebs_volume_count": 0
    },
    "node_type_id": "i3.xlarge",
    "ssh_public_keys": [],
    "custom_tags": {},
    "spark_env_vars": {
        "PYSPARK_PYTHON": "/databricks/python3/bin/python3"
    },
    "autotermination_minutes": 120,
    "init_scripts": []
}
EOF

# create cluster
databricks clusters create --json-file create-cluster.json
