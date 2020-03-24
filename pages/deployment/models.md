---
title: "Deployment Models"
keywords: deploy
#tags: []
sidebar: home_sidebar
permalink: deployment_models.html
toc: false
---

## Single Network Interface

The standard use case for a perfSONAR node is operate tests (either
throughput- or latency-based) on a single network interface card.  The
speed of the card does not matter and should reflect the desire of the
operator.

{% include image.html file="deploy/models/1g.jpg" alt="perfSONAR with 1 Gbps interface" %}
{% include image.html file="deploy/models/10g.jpg" alt="perfSONAR with 10 Gbps interface" %}

Testing throughput and latency simultaneously on a single interface is
possible, but has been shown to impact test accuracy.


## Dual Network Interfaces

perfSONAR supports simultaneous forms of testing by *dual-homing* the
host to use two network interface cards.  The toolkit software allows
the operator to configure both network cards, and specify which
interfaces will be used for a specific type of measurement.

{% include image.html file="deploy/models/dual.jpg" alt="perfSONAR with dual interfaces" %}

More information on this operational style can be found
[here](http://docs.perfsonar.net/manage_dual_xface.html).


## Performance Beacon

The basic use case for perfSONAR is to make the node available for
others to use.  This is referred to as the _beacon_ use case.  By
setting up the node, keeping it "open" (i.e., not imparting policy
that would prevent the average user from initiating a test), and
ensuring that it remains operational, networks can allow others the
ability to learn what their end-to-end performance characteristics
look like.

{% include image.html file="deploy/models/beacon.png" alt="perfSONAR as a performance beacon" %}

Other sites can incorporate this node into their testing, by hand and
by regular testing means.  A beacon can be created using the perfSONAR
toolkit ISO or bundled RPM install.  The former methods are preferred
from a usability and maintainability standpoint.


## Performance Island

Similar to the case of the beacon, a _performance island_ stands
alone, but is configured to test to other beacons, islands, and mesh
members by the maintainer.

{% include image.html file="deploy/models/island.png" alt="perfSONAR as a performance island" %}

This method requires more maintenance to identify hosts to test with,
and is able to store and produce graphs of the results of testing.
This instance can be created using the perfSONAR toolkit ISO or
bundled RPM install.


## Mesh

Establishing a performance "mesh" involves coordinating several nodes,
potentially maintained in different networks, via a shared
configuration file that describes a test.  This configuration is read
by the tools, which then perform the tests and store the results in
either a central location, or on each of the members.

{% include image.html file="deploy/models/mesh.png" alt="perfSONAR in a mesh" %}

Software such as
[MaDDash](https://docs.perfsonar.net/maddash_intro.html) can be used
to visualize the collective results:

{% include image.html file="deploy/models/maddash.png" alt="perfSONAR mesh with MaDDash" %}

This instance can be created using the perfSONAR toolkit ISO or bundled
RPM install.
