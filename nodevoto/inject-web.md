Let's add Linkerd to the application:

`kubectl -n nodevoto get deploy web -o yaml | linkerd inject - | kubectl apply -f -`{{execute}}

This command retrieves the `web` deployment, runs this through `inject` and
finally reapplies it to the cluster. `inject` augments the resources to include
the data plane's proxies. As with `install`, `inject` is a pure text operation.
This means that you can inspect the input and output before you use it. You can
even run the output through `diff` to see exactly what is changing.

Once piped into `kubectl apply`, Kubernetes will execute a rolling deploy and
update each pod with the data plane's proxies, all without downtime.

You've added Linkerd to existing services without touching the original YAML!
Because `inject` augments YAML, it would be possible to take the original
`nodevoto.yml` and do the same thing.

Just like with the control plane, it is possible to verify that everything
worked the way it should with the data plane. To do this check, run:

`linkerd -n nodevoto check --proxy`{{execute}}

With the `web` deployment now a part of Linkerd's data plane, the "golden"
metrics (throughput, success rate and latency) will be collected and visible.
Let's see what's there next.
