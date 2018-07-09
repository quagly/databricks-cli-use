#!/bin/bash
set -euo pipefail

# note that databricks workspace export will not overwrite existing files even if they have changed
# so delete export dir before export

DATABRICKS_USER="mike@arsquanta.com"
SOURCE_DIR="/Users/${DATABRICKS_USER}/"
TARGET_DIR="${HOME}/databricks/export/${DATABRICKS_USER}/"

rm -r $TARGET_DIR

databricks workspace export_dir $SOURCE_DIR $TARGET_DIR
