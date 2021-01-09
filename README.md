# OpenShift Network Policy Recipes

![You can get stuff like this](img/1.gif)
_You can get stuff like this with Network Policies..._

## Overview

This repository consists of two branches:

1. `ocp4-recipes` branch is based on and updated from the `upstream-k8s-recipes` branch but with OpenShift examples, use cases, and scenarios.
2. `upstream-k8s-recipes` branch tracks the upstream (forked) repository for any changes and updates. Kubernetes & GKE are used in these examples.

This repository contains various use cases of Kubernetes
[Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
and sample YAML files to leverage in your OpenShift cluster. If you have ever wondered
how to drop/restrict traffic to applications running on OpenShift, read on.

Easiest way to try out Network Policies is to create a new [Red Hat OpenShift 4](https://www.openshift.com/try) cluster. Applying Network
Policies on your existing cluster can disrupt the networking.

If you are just getting started with Network Policies and are looking to learn more, I highly recommend reading Ahmet Alp Balkan's ([@ahmetb](https://twitter.com/ahmetb))
[Securing Kubernetes Cluster Networking](https://ahmet.im/blog/kubernetes-network-policy/)
article first.

## Before you begin

> It is really recommended [to watch this KubeCon talk on Network
Policies](https://www.youtube.com/watch?v=3gGpMmYeEO8) for a deeper
understanding of this feature. It will also help you understand the
origins and foundations of this repo better.

- [Create a cluster](00-create-cluster.md)

## Basics

- [DENY all traffic to an application](01-deny-all-traffic-to-an-application.md)
- [LIMIT traffic to an application](02-limit-traffic-to-an-application.md)
- [ALLOW all traffic to an application](02a-allow-all-traffic-to-an-application.md)

## Namespaces

- [DENY all non-whitelisted traffic in the current namespace](03-deny-all-non-whitelisted-traffic-in-the-namespace.md)
- [DENY all traffic from other namespaces](04-deny-traffic-from-other-namespaces.md) (a.k.a. LIMIT access to the current namespace)
- [ALLOW traffic to an application from all namespaces](05-allow-traffic-from-all-namespaces.md)
- [ALLOW all traffic from a namespace](06-allow-traffic-from-a-namespace.md)
- [ALLOW traffic from some pods in another namespace](07-allow-traffic-from-some-pods-in-another-namespace.md)

## Serving External Traffic

- [ALLOW traffic from external clients](08-allow-external-traffic.md)

## Advanced

- [ALLOW traffic only to certain port numbers of an application](09-allow-traffic-only-to-a-port.md)
- [ALLOW traffic from apps using multiple selectors](10-allowing-traffic-with-multiple-selectors.md)

## Controlling Outbound (Egress) Traffic 🔥🆕🔥

- [DENY egress traffic from an application](11-deny-egress-traffic-from-an-application.md)
- [DENY all non-whitelisted egress traffic in a namespace](12-deny-all-non-whitelisted-traffic-from-the-namespace.md)
- 🔜 LIMIT egress traffic from an application to some pods
- 🔜 ALLOW traffic only to Pods in a namespace
- [LIMIT egress traffic to the cluster (DENY external egress traffic)](14-deny-external-egress-traffic.md)

-----

### Authors

Updates and OpenShift content by Jared Burck ([@JaredBurck](https://twitter.com/jaredburck)) and Red Hat CoP ([@RedHatCoP](https://twitter.com/RedHatCoP)).

Originally created by Ahmet Alp Balkan ([@ahmetb](https://twitter.com/ahmetb)).

Copyright 2017, Google Inc. Distributed under Apache License Version 2.0 ,see [LICENSE](LICENSE) for details.

Disclaimer: This is not an official Google or Red Hat product.
