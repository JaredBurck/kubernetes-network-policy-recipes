#!/usr/bin/env bash
# Validate all NetworkPolicy manifests with oc/kubectl apply --dry-run=client.
# Usage: ./validate-manifests.sh [optional-namespace-for-server-dry-run]
set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
CLIENT_FAIL=0
for f in *.yaml; do
  [ -f "$f" ] || continue
  if oc apply -f "$f" --dry-run=client 2>&1; then
    echo "  OK (client) $f"
  else
    echo "  FAIL (client) $f"
    CLIENT_FAIL=1
  fi
done
if [ "$CLIENT_FAIL" -ne 0 ]; then
  echo "One or more manifests failed client dry-run."
  exit 1
fi
echo "All manifests passed client dry-run."
# Optional: server dry-run if namespace given (requires cluster access)
if [ -n "$1" ]; then
  echo "Server dry-run with namespace: $1"
  for f in *.yaml; do
    [ -f "$f" ] || continue
    # Files with metadata.namespace must match -n or we override; skip server if namespace in file differs
    if oc apply -f "$f" -n "$1" --dry-run=server 2>&1; then
      echo "  OK (server) $f"
    else
      echo "  SKIP or FAIL (server) $f"
    fi
  done
fi
exit 0
