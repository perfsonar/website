---
title: "Local Deployment"
keywords: deploy
#tags: []
sidebar: home_sidebar
permalink: deployment_local.html
toc: true
---

## WAN and LAN Demarcation

perfSONAR is a tool designed to troubleshoot end to end performance.
A typical use case is to deploy a perfSONAR node on the edge, or
within, a campus network and test to resources that are located far
away:

 * The demarcaction with your network provider

 * Accross other networks in the path between your network, and a
   collaborator

 * To the faility of a collaborator

It is common to see several perfSONAR nodes deployed in a campus
setting:

{% include image.html file="deploy/local/campus.png" alt="perfSONAR on campus" %}

If there is a desire to test the characteristics of a network within a
LAN, there are several considerations to note; all of which are
related to the macro-behavior of TCP:

 * When latency is small (e.g. \< 10 ms) the behavior of TCP can
   produce "high" throughput values, even for situations where a large
   amount of packet loss is seen.
 
 * A heavier "throughput" test consumes memory buffers on switching
   and routing devices on each hop of a path.  This
   measurement-induced congestion could cause problems for other local
   traffic.

 * Publically-addressable perfSONAR nodes may be found by anyone
   looking to invoke a test - if a node is located on a smaller
   internal network it could be the target of heavyweight bandwidth
   testing unless protected.


The following sections discuss some of the pitfalls with local
deployment scenarios. 


## Local-Area Networks

Consider a LAN network that is switched between buildings, and broken
up into individual subdomains.  Some buildings have a perfSONAR node
managed by the networking organization.  Some departments may have
their own tester as well.

{% include image.html file="deploy/local/lan.png" alt="perfSONAR on the LAN" %}

perfSONAR is designed to be individually managed, but can be
configured to perform cooperative testing between instances.  It may
be the case that all of the networking organization nodes participate
in a "mesh" of tests.  Those that are managed by other departments
could be involved in testing that is either ad-hoc or regular.  In
either case - measurement traffic within the LAN must complete with
other background activities, and has the potential to be destructive.


## Outbound Testing

In this scenario, several of the perfSONAR nodes are configured to
test using a throuhgput test to resources that are located outside of
the campus environment.  It could be the case that the nodes managed
by the networking organization are testing to the border node - or to
the one that the upstream network provder makes available.  The
departmental nodes could be testing to remote collaborators.

{% include image.html file="deploy/local/outbound.png" alt="Outbound testing" %}

There is not a central scheduling instance to manage the traffic for
multiple perfSONAR nodes.  Each node communicates with the far end
daemon to schedule a time for measurement.  It could be the case that
measurements "overlap" on certain links, if they are scheduled to be
run at the same exact time.  In the example above the switch in
Building B may be managing inbound traffic from 2 perfSONAR nodes, and
sharing the output queue buffer space on link L2.  Link L1, the campus
uplink to the network provider, could be managing measurement traffic
from up to 5 instances (in addition to the traffic from the regular
operations of the campus).

There are ways to get around this scenario:

 * Ensure all perfSONAR nodes are centrally managed, running a
   specific schedule that limits testing to the outside world.  In
   particular, only nodes that are near important resources
   (e.g. storage, processing) or at the border should be involved in
   wide area throughput testing.

- Adjust pScheduler limits on nodes located deep in the campus to
  prevent long tests that consume bandwidth resources.

 * Ensure that all buffers on devices in the path are properpy tuned
   to prevent congestion from heavy tests.

In general, heavyweight testing with a throughtput measurement from
inside of the campus to the WAN should be discouraged unless
absolutely necessary.  Lighter testing for latency and packet loss are
allowable.


## Inbound Testing

perfSONAR nodes that receive a public facing address, and that are
configured with a set of adminstrative information, will "register" to
the lookup service automatically.  This registration allows others in
the community to locate a node to perform tests with.  This
registration can be disabled, but the default use case is to do this
when the node is created.

In the network below, all of the perfSONAR nodes, with the exception
of the one located in Department 5, were configured with a public
address and are available in the lookup service.  Staff at remote
facilities were able to find these on a search.  Not knowing what the
internal topology looks like for the campus - testing to any of these
nodes (unless they have a descriptive host name) is now possible.

{% include image.html file="deploy/local/inbound.png" alt="Inbound testing" %}

If three external sites configure regular bandwidth tests to the nodes
on this campus, there is the potential to have heavy streams of
traffic entering into the network at any time.  Remember that there is
no central scheduling service - three independent locations on the
outside could test ot 3 indepdent locations on the inside and they may
overlap from time to time.  This means that our facility router, and
link L1, could be managing a lot of inbound traffic.  Link L2, and the
switch in Building A, will also become saturated if these tests
overlap, potentially pushing other legitmate traffic out.

As in the previous example, there are ways we can mitigate this:

 * Disable the registration service to prevent nodes from being found.

 * Assign private IP space so they are not routable.

 * Adjust pScheduler limits on nodes located deep in the campus to
   prevent long tests that consume bandwidth resources - or lock out
   network address space that should not be performing tests
   completely.

 * Ensure that all buffers on devices in the path are properpy tuned
   to prevent congestion from heavy tests.

The best approach to preventing someone on the outside from testing to
a node you wish to keep private is to make the node private.  The
pScheduler limits approach would be prefered, since this will allow
you to add controls based on network address while still keeping the
resource public and available.


## Internal Testing

The previous two situations focused on tests going to, or coming from,
the WAN.  It is still possible to cause a lot of problems by testing
to things internally.  The network shown below features perfSONAR
nodes that are configured to test to each other across the LAN:

{% include image.html file="deploy/local/internal.png" alt="Internal testing" %}

This is a very dangerous and not very useful method of testing.  When
the latency between hosts is short (in a LAN this could be \< 3ms),
throughput tests will be very useless.  Even with packet loss, TCP
will allow a fast ramp up/recovery and show a high throughput number.

It is useful to be able to verify that a host can perform at line
rate, but this should not be done regularlly.  Additionally, the
traffic from lots of internal throughput testing can cause congestion
for real traffic on your network.  In the example above, we are
needlessly filling the buffers on several switches, and the facility
router, just to perform local testing.

It is suggested that throughput tests locally be avoided.  If they are
a requirement to validate a service level, consider running them very
infrequently (no more than once per day, or even once per week).



## Suggested Approaches for Local Testing

Lightweight tests are the most useful for a LAN.  One-way latency
testing and packet loss, along with round-trip time, can be configured
to test within a LAN with minimal impact on services.  The network
below shows this setup:

{% include image.html file="deploy/local/suggested.png" alt="Suggested local testing approach" %}

A central node located at the border has been configured to make
regular tests to "beacon" nodes within the campus.  This testing will
tell us the latency and packet loss characteristics between the
beacons and the border.  Note that in this setup, there is a
duplication of testing on certain links (e.g. link L2 is shared by 2
perfSONAR nodes).  Lightweight testing will not consume many resources
on a given switch or link; if your campus is large and you are testing
to 100s of acess points it may be more beneficial to create cliques of
test members.

Also in this diagram, we show the likely location for throughput
testing to and from the outside world.  The beacon nodes can be
configured with private IPs, have their registration turned off, or
have limitations put on pScheduler to prevent heavy testing.  External
parties looking to perform a heavy test will find only the border
instance, and use this.  If for some reason there is an important
function located in the campus (high performance computing, research
enclave), setting up a public perfSONAR node there may be worth while
if the network can support heavy testing.
