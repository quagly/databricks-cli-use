#!/bin/bash

# get most recent non-beta databricks version number
VERSION=$(databricks clusters spark-versions | jq '.versions[] | .name' | grep -v beta  | grep -o '^"[[:digit:]]\.[[:digit:]]' | tr -d '"' | sort -u | tail -1)
echo "${VERSION}"
