Create a new spec that describes a folder to sync between a local directory and a directory inside a running container on the remote cluster. The local directory is empty and that is okay. Because ksync is bi-directional, it will move all the files from the running container locally. This is just a convenient way to get the code from the container and skip a couple steps. If you're working with a local copy already, only the most recently updated files will be transfered between the container and your local machine.

`mkdir -p $(pwd)/ksync`{{execute}}
`ksync create --selector=app=app $(pwd)/ksync /code`{{execute}}

Check on the status. You should see a watching state with a pod name in the list.

`ksync get`{{execute}}

Take a look at the files that have been synced from the container (running on the cluster) locally.

`ls -l ksync`{{execute}}
