Looking at some high level stats about the app will instantly show that there
are some issues:

`linkerd -n nodevoto stat deploy`{{execute}}

A success rate below 100% isn't good. Take a look at the dashboard that you
started in the last step, it will be able to show more details. In fact,
navigate to the detail view for the web deployment.






for some extra details on what's going on. Note: this is also available via
`linkerd -n nodevoto top deploy`.
