ksync speeds up developers who build applications for Kubernetes. It transparently updates containers running on the cluster from your local checkout. This enables developers to use their favorite IDEs, such as Atom or Sublime Text to work from inside a cluster instead of from outside it. There is no reason to wait minutes to test code changes when you can see the results in seconds.

If you've been wanting to do something like docker run -v /foo:/bar with Kubernetes, ksync is for you!

This scenario will walk you through:

- Setting up a kubernetes cluster.
- Getting ksync installed and running.
- Fetching files from a container running on the cluster.
- Updating the container by editing files locally.
