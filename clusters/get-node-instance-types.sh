#!/bin/bash
set -euo pipefail

# get all supported databricks node instance types
# exclude deprecated instances
INSTANCE_TYPES=$(databricks clusters list-node-types  | jq ".node_types[] | select(.is_deprecated==false) | .instance_type_id" | tr -d '"' | sort -u)
echo "${INSTANCE_TYPES}"

