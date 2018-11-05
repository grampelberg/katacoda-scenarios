Let's get started by installing the CLI:

`curl https://run.linkerd.io/install | sh`{{execute}}

Next, add `linkerd` to your path with:

`export PATH=$PATH:$HOME/.linkerd2/bin`{{execute}}

Use the CLI to verify that your cluster is compatible with Linkerd by running:

`linkerd check --pre`{{execute}}

After everything passes, it is time to install the control plane:

`linkerd install | kubectl apply -f -`{{execute}}

`linkerd install` generates a list of Kubernetes resources. Run it standalone
if you would like to understand what is going on. By piping the output of
`linkerd install` into `kubectl`, the Linkerd control plane resources will be
added to your cluster and start running immediately.

It may take a minute or two for your Kubernetes cluster to pull the Linkerd
images and start all the components. While that’s happening, we can validate
that everything’s happening correctly by running:

`linkerd check`{{execute}}

If you're interested in what components were installed, you can run:

`linkerd -n linkerd get deploy`{{execute}}

With Linkerd installed onto the cluster, the next step will be to explore a
little and see what is happening.
