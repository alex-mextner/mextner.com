#!/bin/bash
# Manual redeploy: runs the same GitHub Actions pipeline as a push to main
# (build on GitHub, publish on the odroid self-hosted runner), then waits for it.
set -euo pipefail

REPO=alex-mextner/mextner.com
latest_dispatch() {
  gh run list -R "$REPO" --workflow deploy.yml --event workflow_dispatch -L1 \
    --json databaseId -q '.[0].databaseId // 0'
}

# Run ids increase monotonically, so the new run is the first id above the
# pre-dispatch one (no clock comparison between this machine and GitHub).
before=$(latest_dispatch)
gh workflow run deploy.yml -R "$REPO" --ref main

run_id=$before
for _ in $(seq 1 15); do
  run_id=$(latest_dispatch) || run_id=$before # transient API error: keep polling
  [ "$run_id" != "$before" ] && break
  sleep 2
done
[ "$run_id" != "$before" ] || { echo "dispatched run not found" >&2; exit 1; }

gh run watch "$run_id" -R "$REPO" --exit-status
