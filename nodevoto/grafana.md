Linkerd provides some standard dashboards right out of the box. This provides a
great heads up view into the health of a service that can be used for monitoring
and a basis for alerting. To check these out, run:

`./expose-grafana.sh`{{execute}}

Then you can open the [nodevoto dashboard](https://[[HOST_SUBDOMAIN]]-9093-[[KATACODA_HOST]].environments.katacoda.com/d/6svnwykmk/linkerd-deployment?refresh=5s&orgId=1&var-namespace=nodevoto&var-deployment=web&var-inbound=All&var-outbound=All)
and see what's going on in your browser.

![web dashboard](assets/web-dashboard.png)

At the top of the screen is a dropdown with many different dashboards, take a
look around! Another interesting dashboard is the [top line](https://[[HOST_SUBDOMAIN]]-9093-[[KATACODA_HOST]].environments.katacoda.com/d/XKy9QWRmz/linkerd-top-line?refresh=5s&orgId=1) dashboard.

![top line dashboard](assets/top-line-dashboard.png)

Armed with dashboards, it is obvious that there are issues with this service.
Now, we should debug a little bit more and understand what is happening behind
the scenes.
