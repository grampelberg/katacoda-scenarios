To get a feel for how Linkerd would work for one of your services, you can
install the demo application. It provides an excellent place to look at all
the functionality that Linkerd provides. To install it in its own namespace
(emojivoto), run:

`curl https://run.linkerd.io/emojivoto.yml | kubectl apply -f -`{{execute}}

This command fetches the Kubernetes config for an example application that
allows voting for gifs.

First, let's wait until everything is running. You can do that with:

`kubectl -n emojivoto rollout status deploy/web`{{execute}}

Once this has returned, you can look at what is running with:

`kubectl -n emojivoto get all`{{execute}}

The topology looks like this:

![emojivoto topology](assets/topology.png)

There's a traffic generator (vote-bot), a web frontend (web), a backend to
record votes (voting) and an index of emojis (emoji).

To take a look at your new emoji voting application, run:

`kubectl -n emojivoto port-forward svc/web-svc 9090:80 > /dev/null &`{{execute}}

Then you can [open emojivoto](https://[[HOST_SUBDOMAIN]]-9091-[[KATACODA_HOST]].environments.katacoda.com/)
and see what's going on in your browser. Try clicking on the first emoji to vote
for it and see what happens (spoiler, it will fail about 50% of the time)!

![emojivoto](assets/emojivoto.png)

If you were to inspect your handy local Kubernetes dashboard, you wouldn’t see
very much of interest — as far as Kubernetes is concerned, the app is running
just fine. This is a very common situation! Kubernetes understands whether your
pods are running, but not whether they are responding properly.

To get some added visibility into what is going on and see some of the functionality of Linkerd, let’s add Linkerd to emojivoto by running:

`kubectl get -n emojivoto deploy -o yaml | linkerd inject - | kubectl apply -f -`{{execute}}

This command retrieves all of the deployments running in the `emojivoto`
namespace, runs the set of Kubernetes resources through `inject`, and finally
reapplies it to the cluster. `inject` augments the resources to include the
data plane’s proxies. As with `install`, `inject` is a pure text operation,
meaning that you can inspect the input and output before you use it. You can
even run it through `diff` to see exactly what is changing.

Once piped into `kubectl apply`, Kubernetes will execute a rolling deploy and
update each pod with the data plane’s proxies, all without any downtime.

You’ve added Linkerd to existing services without touching the original YAML!
Because `inject` augments YAML, it would also be possible to take
`emojivoto.yml` itself and do the same thing (`cat emojivoto.yml | linkerd inject -`).
This is a great way to get Linkerd integrated into your CI/CD pipeline. You can choose which services use Linkerd one at a time and incrementally add them to the data plane.

Just like with the control plane, it is possible to verify that everything
worked the way it should with the data plane. To do this check, run:

`linkerd -n emojivoto check --proxy`{{execute}}

Let's dig into all the interesting things Linkerd provides for this service.
