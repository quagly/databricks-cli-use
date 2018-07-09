#!/bin/bash
set -euo pipefail

# configure with token
databricks configure --token

# set up alternate profile
# databricks configure --token --profile PROFILE_NAME
