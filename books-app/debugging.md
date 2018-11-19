Looking at some high level stats about the app will instantly show that there
are some issues:

`linkerd -n booksapp stat deploy`{{execute}}

A success rate below 100% isn't good. Let's open the Linkerd dashboard to the
web's detail view. The URL for that is:

`echo ${DASHBOARD}/namespaces/booksapp/deployments/webapp`{{execute}}

Paste this link from the terminal into your browser and you'll see some details.
This includes incoming requests and outgoing requests.

FIXME
![web detail](assets/web-detail.png)

Below the traffic diagram is a table. This is `top` for your services and shows
the request paths being processed in real time.

There are two important pieces of data here. The first one is the requests from
`traffic`. The success rate of this path is low and definitely the error that
is showing up when we try to add a new book.

FIXME
![vote failure](assets/incoming-request.png)

Looking down a little further, there are requests going to `books`. This is
where we start to understand what the problem is. For whatever reason, 50%
of the time someone tries to add a new book, it fails. This provides enough
visibility into what is going wrong to potentially fix the problem.

FIXME
![voting failure](assets/outgoing-request.png)

Let's look at the actual requests by using `tap` on them
in real time and looking for failures. Click the microscope icon next to
`/nodevoto.v1.VotingService/VoteCartoonHalloweenGhost` to see the actual request
and response details for this interaction.

FIXME
![tap](assets/tap.png)

This is all available via the CLI as well. To see top, you can run:

`linkerd -n booksapp top deploy/webapp`{{execute}}

For tap, it is:

`linkerd -n booksapp tap deploy/webapp`{{execute}}
