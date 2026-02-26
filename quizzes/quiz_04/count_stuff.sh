#!/bin/bash
set -ueo pipefail

dir_name=$1
dir_count=$(ls -la $dir_name | wc -l)
echo $dir_count
