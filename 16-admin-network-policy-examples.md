# AdminNetworkPolicy (ANP) and BaselineAdminNetworkPolicy (BANP) examples

[AdminNetworkPolicy (ANP)](https://kubernetes.io/docs/concepts/services-networking/admin-network-policy/) and [BaselineAdminNetworkPolicy (BANP)](https://kubernetes.io/docs/concepts/services-networking/baseline-admin-network-policy/) are cluster-scoped policies that apply to all namespaces. They require a cluster that supports the [Admin Network Policy API](https://kubernetes.io/docs/concepts/services-networking/admin-network-policy/) (Kubernetes 1.27+ as alpha, or OpenShift with the appropriate feature).

**Platform support:** Check your Kubernetes or OpenShift version; ANP/BANP may be in alpha/beta or behind a feature gate. OpenShift 4.x support may vary by version.

## BaselineAdminNetworkPolicy (BANP): cluster-wide baseline

BANP defines a **default** that applies to all namespaces. Only one BANP can exist in the cluster.

### Example: default deny all ingress (baseline)

```yaml
apiVersion: policy.networking.k8s.io/v1alpha1
kind: BaselineAdminNetworkPolicy
metadata:
  name: default
spec:
  subject:
    namespaces: {}   # all namespaces
  ingress:
  - action: Deny
    from: []
  egress:
  - action: Deny
    to: []
```

This establishes a cluster-wide baseline of deny-all; namespace-level NetworkPolicies can then allow specific traffic.

### Example: allow DNS egress only (baseline)

```yaml
apiVersion: policy.networking.k8s.io/v1alpha1
kind: BaselineAdminNetworkPolicy
metadata:
  name: default
spec:
  subject:
    namespaces: {}
  egress:
  - action: Allow
    to: []
    ports:
    - port: 53
      protocol: UDP
    - port: 53
      protocol: TCP
  - action: Deny
    to: []
```

(Adjust `to`/`from` and API version to match your cluster; the exact CRD and fields depend on the implementation.)

## AdminNetworkPolicy (ANP): admin-level rules

ANP allows cluster admins to define policies that apply to selected namespaces or pods. Multiple ANPs can exist.

### Example: deny ingress from a specific namespace

```yaml
apiVersion: policy.networking.k8s.io/v1alpha1
kind: AdminNetworkPolicy
metadata:
  name: deny-from-dev-namespace
spec:
  subject:
    namespaces:
      matchLabels:
        env: prod
  ingress:
  - action: Deny
    from:
    - namespaces:
        matchLabels:
          env: dev
  priority: 1000
```

(API version and field names may differ; consult your cluster’s ANP/BANP documentation.)

## OpenShift 4 note

On OpenShift, DNS runs in **`openshift-dns`**. If your BANP/ANP allows or denies by namespace, use `openshift-dns` (not `kube-system`) for DNS-related rules.

## References

- [Kubernetes Admin Network Policy](https://kubernetes.io/docs/concepts/services-networking/admin-network-policy/)
- [Kubernetes Baseline Admin Network Policy](https://kubernetes.io/docs/concepts/services-networking/baseline-admin-network-policy/)

[<---BACK to README](../README.md)
