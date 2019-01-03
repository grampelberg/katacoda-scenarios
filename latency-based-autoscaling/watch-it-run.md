You can glance at the Linkerd dashboard and see all the HTTP/2 (gRPC) and
HTTP/1 (web frontend) speaking services show up in the list of resources running
in the emojivoto namespace. If you've closed the dashboard, don't worry! The URL
is returned by running:

`. expose-dashboard.sh`{{execute}}

The data in the dashboard can also be consumed via Linkerd's CLI. To see some
high level stats, you can run:

`linkerd -n emojivoto stat deploy`{{execute}}

This will show the "golden" metrics for each deployment:

- Success rates
- Request rates
- Latency distribution percentiles

To dig in a little further, it is possible to `top` the running services in real
time and get an idea of what is happening on a per-route basis. To see this,
run:

`linkerd -n emojivoto top deploy`{{execute}}

These are all great for seeing real time data, but what about things that
happened in the past? Check out the grafana integration in the next step!

Linkerd includes Grafana to visualize all the great
metrics collected by Prometheus and ships with some extremely valuable
dashboards. You can get to these by clicking the Grafana icon in the overview
page.
