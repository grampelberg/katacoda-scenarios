Now that you have the CLI running locally, it’s time to install the Conduit control plane onto your Kubernetes cluster. Don’t worry if you already have things running on this cluster—the control plane will be installed in a separate `conduit` namespace, where it can easily be removed.

`conduit install | kubectl apply -f -`{{execute}}

This generates a Kubernetes config, and pipes it to kubectl. Kubectl then applies the config to your Kubernetes cluster.

To verify the Conduit server version, run:

`conduit version`{{execute}}

Normally, you'd use `conduit dashboard` to view the GUI. Because this tutorial is running in Katacoda, we need to do a little extra work. Run:

`/root/dashboard.sh`{{execute}}

This will start the dashboard and setup a tunnel for you to view it from. Cut and paste the URL that is output into your browser.

Of course, you haven’t actually added any services to the mesh yet, so the dashboard won’t have much to display beyond the status of the service mesh itself.
