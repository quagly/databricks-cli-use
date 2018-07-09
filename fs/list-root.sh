#!/bin/bash
set -euo pipefail

# list root databricks directory
# there does not seem to be a recursive option
databricks fs ls --absolute -l dbfs:/
