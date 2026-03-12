# OpenShift Virtualization: Network Policies for VM workloads

This document covers NetworkPolicy use cases for [OpenShift Virtualization](https://docs.openshift.com/container-platform/stable/virt/about-virt.html) (KubeVirt/CNV) and VM workloads.

## Scope

- Standard Kubernetes NetworkPolicies apply to **pods**, including the **`virt-launcher`** pods that host VMs.
- Policies target the `virt-launcher` pod (and thus the VM's traffic), not the guest OS directly.
- Do **not** apply default-deny to the `openshift-cnv` namespace without explicitly allowing migration and API traffic.

## Use cases

### Restrict VM-to-VM traffic by labels

You can allow traffic only between VMs (virt-launcher pods) that have matching labels, e.g. same application or tenant:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-vm-to-vm-same-app
  namespace: my-app
spec:
  podSelector:
    matchLabels:
      kubevirt.io/domain: my-vm
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: my-app
```

### Allow migration and API traffic in openshift-cnv

If you use namespace-level default-deny, ensure the **`openshift-cnv`** namespace can receive migration and API traffic. Example (allow from cluster to CNV for migration/API):

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-cnv-migration-api
  namespace: openshift-cnv
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  ingress:
  - from:
    - namespaceSelector: {}
    ports:
    - port: 443
    - port: 2049
    - port: 49152
      endPort: 49215
```

Exact ports depend on your OCP/KubeVirt version; consult [OpenShift Virtualization documentation](https://docs.openshift.com/container-platform/stable/virt/virt_networking/virt-network-policies.html).

### Multus and secondary networks

NetworkPolicy applies to the **default pod network**. If you use Multus and secondary networks (e.g. SR-IOV, OVN secondary), those interfaces are not controlled by NetworkPolicy; you may need other mechanisms (e.g. NAD, node-level rules) for those networks.

## References

- [OpenShift Virtualization – Network policies](https://docs.openshift.com/container-platform/stable/virt/virt_networking/virt-network-policies.html)
- [KubeVirt networking](https://kubevirt.io/user-guide/docs/latest/administration/networking.html)

[<---BACK to README](../README.md)
