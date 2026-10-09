#!/bin/bash
# Manual redeploy: runs the same GitHub Actions pipeline as a push to main
# (build on GitHub, publish on the odroid self-hosted runner), then waits for it.
set -euo pipefail

REPO=alex-mextner/mextner.com
since=$(date -u +%Y-%m-%dT%H:%M:%SZ)

gh workflow run deploy.yml -R "$REPO" --ref main

# The dispatched run takes a few seconds to appear; pick the first one created after dispatch.
run_id=""
for _ in $(seq 1 15); do
  run_id=$(gh run list -R "$REPO" --workflow deploy.yml --event workflow_dispatch -L5 \
    --json databaseId,createdAt -q "[.[] | select(.createdAt >= \"$since\")] | last | .databaseId // empty")
  [ -n "$run_id" ] && break
  sleep 2
done
[ -n "$run_id" ] || { echo "dispatched run not found" >&2; exit 1; }

gh run watch "$run_id" -R "$REPO" --exit-status
