# Standalone NetworkPolicy manifests

These YAML files are extracted from the [recipe documentation](../README.md) for use with GitOps, automation, or `kubectl apply --dry-run=client` validation.

| File | Recipe |
|------|--------|
| `default-deny-all-ingress.yaml` | 03 – Deny all non-whitelisted traffic in the namespace |
| `default-deny-all-egress.yaml` | 12 – Deny all non-whitelisted egress from the namespace |
| `web-deny-all.yaml` | 01 – Deny all traffic to an application |
| `deny-from-other-namespaces.yaml` | 04 – Deny traffic from other namespaces |

Apply from the appropriate namespace; adjust `metadata.namespace` and selectors as needed for your environment.
