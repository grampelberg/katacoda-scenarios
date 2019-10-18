Install ksync. This will fetch the binary and put it at `/usr/local/bin`.

`curl https://ksync.github.io/gimme-that/gimme.sh | bash`{{execute}}

Initialize ksync and install the server component on your cluster. The server component is a DaemonSet that provides access to each node's filesystem. This will also go through a set of pre and postflight checks to verify that everything is working correctly. You can run these yourself by using `ksync doctor`.

`ksync init`{{execute}}

Startup the local client. It watches your local config to start new jobs and the kubernetes API to react when things change. This will just put it into the background. Feel free to run in a separate terminal or add as a service to your host.

`ksync watch --daemon`{{execute}}
