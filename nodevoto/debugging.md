Looking at some high level stats about the app will instantly show that there
are some issues:

`linkerd -n nodevoto stat deploy`{{execute}}

A success rate below 100% isn't good. You can either look [at the dashboard]
(https://[[HOST_SUBDOMAIN]]-9091-[[KATACODA_HOST]].environments.katacoda.com/)
for some extra details on what's going on. Note: this is also available via
`linkerd -n nodevoto top deploy`.
