#!/bin/bash
set -euo pipefail
# copy can only be used to copy between local and remote
# recursive copy is supported with --recursive option
touch /tmp/dbfs-test.txt

databricks fs cp --overwrite dbfs:/copy-test/dbfs-test.txt /tmp/dbfs-test.txt
