# Create a cluster

Most Kubernetes installation methods do not enable the [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
feature by default. You would need to install and configure a network policy
provider such as Calico or Cilium yourself.

**[Red Hat OpenShift Container Platform (OCP) 4][ocp]** provides a supported
OpenShift 4 cluster with Network Policies available. OpenShift SDN (or OVN-Kubernetes, depending on your cluster) is the default networking stack; no separate network policy provider is required. Network Policies have been supported on OpenShift 4 since its release.

Use a **currently supported OpenShift 4.x release** so you receive security and
lifecycle support. Red Hat supports at least four minor versions at a time on a
roughly 4‑month release cadence. For which versions are in support and their
lifecycle phases, see the [OpenShift Container Platform Life Cycle][lifecycle]
and [Product Life Cycles][product-lifecycle] pages.

**Quick trial:** To try OpenShift with Network Policies without installing
your own cluster, use [Red Hat OpenShift trial / try.openshift.com][try].
Choose a supported version when provisioning.

**Install your own cluster:** One way to create an OpenShift 4 cluster with the
installer-provisioned infrastructure (IPI) installer is:

    openshift-install create cluster --dir=ocp4-dev

This creates an OpenShift cluster (size and cloud depend on your configuration)
with Network Policies available and no default policies applied, so all pod
traffic is allowed until you add policies.

Other options include the [Assisted Installer][assisted] (via Red Hat Hybrid
Cloud Console) for bare metal, vSphere, and other platforms, and the
[Agent-based Installer][agent] for disconnected or custom environments. See
the [OpenShift 4 installation documentation][install-docs] for your platform.

When you are done with the tutorial, you can destroy a cluster created with
`openshift-install` by running:

    openshift-install destroy cluster --dir=ocp4-dev

[ocp]: https://www.openshift.com/try
[try]: https://www.openshift.com/try
[lifecycle]: https://access.redhat.com/support/policy/updates/openshift
[product-lifecycle]: https://access.redhat.com/product-life-cycles?product=OpenShift%20Container%20Platform%204
[assisted]: https://docs.openshift.com/container-platform/latest/installing/installing_assisted/assisted-installer-quickstart.html
[agent]: https://docs.openshift.com/container-platform/latest/installing/installing_with_agent_based_installer/installing-with-agent-basic.html
[install-docs]: https://docs.openshift.com/container-platform/latest/installing/index.html
 
[NEXT--->](01-deny-all-traffic-to-an-application.md)
