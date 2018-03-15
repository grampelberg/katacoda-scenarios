Finally, it’s time to install a demo application and add it to the service mesh.

Fetch the demo, add conduit to it and apply to your cluster:

`curl https://raw.githubusercontent.com/runconduit/conduit-examples/master/emojivoto/emojivoto.yml | conduit inject - | kubectl apply -f -`{{execute}}

This command downloads the Kubernetes config for an example gRPC application where users can vote for their favorite emoji, then runs the config through `conduit inject`. The config has the Conduit data plane proxies injected as sidecar containers in the demo's pods. `kubectl` takes care of applying this configuration to your cluster.

As with `conduit install`, in this command, the Conduit CLI is simply doing text transformations, with `kubectl` doing the heavy lifting of actually applying config to the Kubernetes cluster. This pattern is convenient because you can introduce additional filters into the pipeline, or run the commands separately and inspect the output of each one.

At this point, you should have an application running on your Kubernetes cluster, and (unbeknownst to it!) also added to the Conduit service mesh.
