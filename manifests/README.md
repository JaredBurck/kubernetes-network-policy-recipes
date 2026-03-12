# Standalone NetworkPolicy manifests

These YAML files are extracted from the [recipe documentation](../README.md) for use with GitOps, automation, or validation. Each manifest corresponds to one recipe (or variant).

## Manifest index

| File | Recipe | Description |
|------|--------|-------------|
| `web-deny-all.yaml` | 01 | Deny all traffic to an application (app=web) |
| `02-api-allow.yaml` | 02 | Limit traffic to app (only app=bookstore) |
| `02a-web-allow-all.yaml` | 02a | Allow all traffic to app=web |
| `default-deny-all-ingress.yaml` | 03 | Deny all non-whitelisted ingress in namespace |
| `deny-from-other-namespaces.yaml` | 04 | Deny traffic from other namespaces |
| `05-web-allow-all-namespaces.yaml` | 05 | Allow traffic from all namespaces to app=web |
| `06-web-allow-prod-namespace.yaml` | 06 | Allow traffic from namespace with purpose=production |
| `07-web-allow-ns-monitoring.yaml` | 07 | Allow from type=monitoring in team=operations namespaces |
| `08-web-allow-external.yaml` | 08 | Allow external + internal traffic to app=web |
| `09-api-allow-port-5000.yaml` | 09 | Allow traffic only to port 5000 from role=monitoring |
| `10-redis-allow-services.yaml` | 10 | Allow from multiple pod selectors (OR) |
| `11-foo-deny-egress.yaml` | 11 | Deny all egress from app=foo |
| `11-foo-deny-egress-allow-dns.yaml` | 11 (variant) | Deny egress from app=foo but allow DNS |
| `default-deny-all-egress.yaml` | 12 | Deny all non-whitelisted egress in namespace |
| `allow-dns-egress-openshift.yaml` | OCP | Allow DNS to openshift-dns (use with 12) |
| `14-foo-deny-external-egress.yaml` | 14 | Deny external egress (cluster + DNS only) |

Apply from the appropriate namespace; adjust `metadata.namespace` and selectors as needed for your environment.

## Validation

- **Dry-run (client):** `./validate-manifests.sh` or run `oc apply -f <file> --dry-run=client` for each YAML.
- **Dry-run (server):** Use a test project and apply with the correct namespace (files that set `metadata.namespace: default` must be applied to `default` or the YAML adjusted).
- **Live tests:** All recipes (01–14, 02a, 08) and variants have been live-tested on an OpenShift cluster. See [../docs/VALIDATION_REPORT.md](../docs/VALIDATION_REPORT.md) for results and steps.
