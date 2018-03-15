Finally, it’s time to install a demo application and add it to the service mesh.

To install a local version of this demo locally and add it to Conduit, run:

`curl https://raw.githubusercontent.com/runconduit/conduit-examples/master/emojivoto/emojivoto.yml | conduit inject - | kubectl apply -f -`{{execute}}

This command downloads the Kubernetes config for an example gRPC application where users can vote for their favorite emoji, then runs the config through `conduit inject`. This rewrites the config to insert the Conduit data plane proxies as sidecar containers in the application pods.

Finally, `kubectl` applies the config to the Kubernetes cluster.

As with `conduit install`, in this command, the Conduit CLI is simply doing text transformations, with `kubectl` doing the heavy lifting of actually applying config to the Kubernetes cluster. This way, you can introduce additional filters into the pipeline, or run the commands separately and inspect the output of each one.

At this point, you should have an application running on your Kubernetes cluster, and (unbeknownst to it!) also added to the Conduit service mesh.
