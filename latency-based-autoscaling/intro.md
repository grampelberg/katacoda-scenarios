<div style="border-bottom: 1px solid #0a0a0a; padding: 20px;">
  <img src="https://raw.githubusercontent.com/cncf/artwork/master/linkerd/horizontal/color/linkerd-horizontal-color.png" width="40%" />
</div>

Linkerd works by installing ultralight
[proxies](https://linkerd.io/2/architecture#proxy) into each pod of a service.
These proxies become part of a
[*data plane*](https://linkerd.io/2/architecture#data-plane) which reports
telemetry data to, and receives signals from, a
[*control plane*](https://linkerd.io/2/architecture#control-plane). This means
that using Linkerd doesn't require any code changes, and can even be installed
live on a running service.

To interact with Linkerd, you first install the control plane and then add the
data plane proxies to your service. Once installed, you can interact with
Linkerd using:

- A [command-line interface](https://linkerd.io/2/architecture#cli).

- The [Linkerd dashboard](https://linkerd.io/2/architecture#dashboard).

- [Grafana dashboards](https://linkerd.io/2/architecture#grafana) configured for
  you, out of the box.

- From [Prometheus](https://linkerd.io/2/architecture#prometheus) itself.

In this scenario, we’ll walk you through how to install the Linkerd onto a
Kubernetes cluster and deploy a sample gRPC application to show off
what Linkerd can do for your services.

<img src="https://run.linkerd.io/images/katacoda.png?scenario=getting-started" />
