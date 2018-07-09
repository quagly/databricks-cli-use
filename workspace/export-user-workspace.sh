#!/bin/bash
set -euo pipefail

DATABRICKS_USER="mike@arsquanta.com"
SOURCE_DIR="/Users/${DATABRICKS_USER}/"
TARGET_DIR="${HOME}/databricks/export/${DATABRICKS_USER}/"

databricks workspace export_dir --overwrite $SOURCE_DIR $TARGET_DIR
