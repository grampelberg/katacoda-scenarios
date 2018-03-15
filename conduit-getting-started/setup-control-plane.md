Now that you have the CLI running locally, it’s time to install the Conduit control plane onto your Kubernetes cluster. Don’t worry if you already have things running on this cluster—the control plane will be installed in a separate `conduit` namespace, where it can easily be removed.

`conduit install | kubectl apply -f -`{{execute}}

To verify the Conduit server version, run:

`conduit version`{{execute}}

Now, to view the control plane locally, run:

`conduit dashboard`{{execute}}

The first command generates a Kubernetes config, and pipes it to kubectl. Kubectl then applies the config to your Kubernetes cluster.

Of course, you haven’t actually added any services to the mesh yet, so the dashboard won’t have much to display beyond the status of the service mesh itself.

