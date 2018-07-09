#!/bin/bash
set -euo pipefail

# import local export into databricks

DATABRICKS_USER="mike@arsquanta.com"
SOURCE_DIR="${HOME}/databricks/export/${DATABRICKS_USER}/"
TARGET_DIR="/Users/${DATABRICKS_USER}/"

databricks workspace import_dir --overwrite --exclude-hidden-files $SOURCE_DIR $TARGET_DIR
