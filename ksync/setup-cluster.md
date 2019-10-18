Start the cluster via. minikube

`minikube start`{{execute}}

Add the demo app to your cluster. This is a simple python app made with flask. Because ksync moves files around, it would work for any kind of data you'd like to move between your local system and the cluster.

`kubectl apply -f https://ksync.github.io/ksync/example/app/app.yaml`{{execute}}

Make sure that the app is ready and running.

`kubectl get po --selector=app=app`{{execute}}

Forward the remote port to your local system.

`kubectl get po --selector=app=app -o=custom-columns=:metadata.name --no-headers | xargs -IPOD kubectl port-forward POD 8080:80 &`{{execute}}

Take a look at what the app's response is now. You'll see all the files in the remote container, their modification times and when the container was last restarted.

`curl localhost:8080`{{execute}}
