#!/bin/bash
# Manual redeploy: runs the same GitHub Actions pipeline as a push to main
# (build on GitHub, publish on the odroid self-hosted runner).
set -euo pipefail

gh workflow run deploy.yml --ref main
echo "Deploy triggered: gh run watch \$(gh run list --workflow deploy.yml -L1 --json databaseId -q '.[0].databaseId')"
