# Create a cluster

Most of the Kubernetes installation methods out there do not get you a cluster
with [Network
Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
feature. You manually need to install and configure a Network Policy provider
such as Weave Net or Calico.

**[OpenShift Container Platform (OCP)][ocp]** easily lets you get a Red Hat OpenShift 4 cluster with Network Policies feature. You do not need to install a network policy provider yourself, as OpenShift configures the OpenShift SDN as the networking provider for you. (This feature is generally available as of OCP v3.6.)

To create a OpenShift cluster named `ocp4` with Network Policy feature enabled, run:

    openshift-install create cluster --dir=ocp4-dev

This will create a 6-node OpenShift cluster on your cloud of choice with Network
Policy feature enabled and no policies applied out of the box allowing all
communications.

Once you complete this tutorial, you can delete the cluster by running:

    openshift-install delete cluster --dir=ocp4-dev

[ocp]: https://www.openshift.com/try

| <---BACK | [NEXT--->](01-deny-all-traffic-to-an-application.md) |
