---
title: "Node Placement"
keywords: deploy
#tags: []
sidebar: home_sidebar
permalink: deployment_placement.html
toc: true
---

## Giving Measurement a Home

The perfSONAR node should be located based on three simple criteria:

 * Where it can be integrated into the facility's software and
    hardware management systems?

 * Where it can do the most good for the network operators or users?

 * Where it can do the most good for the community?

{% include image.html file="deploy/placement/measurement.png" alt="Measurement node placement" %}

Always locate the perfSONAR node in a location that has proper HVAC and
power considerations.  Most times this means a network or computing
rack. 

In some circumstances, a perfSONAR node may not be server-class
hardware and could be placed in other locations such as an office,
near a wireless controller, or other temporary location as problems
are debugged.


## General Considerations

Operating a perfSONAR node should be done in a consistent manner, based
on how other servers within the domain are administered.  This implies
several considerations:

 * The server must become a citizen of the network.  This means it has
   to be treated the same as other servers.  If your site uses
   configuration management software, install the same software on the
   perfSONAR node.  If the other servers use two factor authentication
   for login, or a jump host that restricts SSH sources, integrate
   these features.  The perfSONAR node cannot become an orphan,
   otherwise the risk of compromise increases.

 * If the perfSONAR node is treated as *disposable*, e.g. it is a test
   beacon only that does not contain any PII (Personally Identifiable
   Information) and is not integrated into the campus, take
   precautions to protect the host as an untrusted member of the
   community.  For instance, do not recycle common passwords or store
   keys on the machine.  Lock down access to key services (e.g. SSH)
   so they can only occur from designated locations, and use the
   perfSONAR features that make regular data backups.

 * In either deployment case, consider the following suggestions for
   administration:

    - Restrict SSH logins to within the domain

    - Maintain IPTables rules to restrict ports

    - Enable automatic updating of YUM

    - Configure rsyslog to send logs to an external host or analyzer

    - Install additional IDS software beyond the defaults for the
      perfSONAR Toolkit

   - If applicable, use a *management* network on a spare networking
     interface to further restrict the access profile for users and
     system data.

 * Give the node a descriptive name.  For example, if it is a a border
   tester, or located in a science DMZ, consider placing that element
   into the host name.  If the host is 10G, or 40G, consider using this
   as well.  An example:  `perfsonar-dmz-10g.school.edu`.

perfSONAR nodes are only as secure and useful as the local site can
make them.  Practicing accepted system administrator policies is
recommended to ensure machines are not compromised or suffer from bit
rot.


## Local Considerations

Local placement, either nodes that are configured to use an RFC1918
address or those that are public, should abide by the following
considerations:

 * Connect the node to the local networking infrastructure in a
   consistent manner with other devices.  For example, if the
   perfSONAR node is located in the same facility as data movement
   machines, utilize the same switch/routing infrastructure.  This
   will give the perfSONAR node the same *view* of the outbound
   network path.  Note that if the access/top-of-rack switch is not
   capable of handling the load of the data movement machines
   (e.g. lack of buffering, congestion because of high fan-in), the
   perfSONAR nodes will react and produce data consistent with a
   problem.


 * Place nodes where they will be most useful.  If the facility is
   distributed, a node at the demarcation of each location (near a
   building router/switch) can help detect problems with the MAN
   infrastructure.  A perfSONAR node located adjacent to functions
   (processing, storage, or scientific instruments) can similarly find
   problems with the portions of the network path that are close to
   these devices.

{% include image.html file="deploy/placement/placement.png" alt="Local placement considerations" %}

If a facility is interested in collecting *internal* data, be aware of
several properties of network measurements over short paths:

 * Throughput tests are unlikely to be useful, as short RTT tests will
   frequently exhibit *high* values, even if packet loss or other
   factors are impacting TCP.

 * Throughput tests will consume network resources quickly, and due to
   the short RTT may not *back off*; this could hurt background
   traffic that is trying to use network resources and traveling over
   a longer RTT.

 * Latency testing from OWAMP requires stable, accurate, and precise
   clock discipline.  In many cases NTP can synchronize a clock to the
   microsecond level, in others there may be a few milliseconds of
   difference.  For short RTTs, the clock skew will become very
   noticeable, and in some cases may produce *negative* latency values
   due to the error in NTP correlation.

Packet loss measurements (also delivered via OWAMP) are the most
valuable local measurement to consider.

For more information about local placement see [Local
Deployments](deployment_local.html)


## Global Placement Considerations

If the perfSONAR node is advertised to the public (e.g. it has a
public-facing IPv4 or IPv6 address), external parties may use it for
testing.  There are several considerations to abide by when exposing a
node for public use:

 * Machines located on the border of a site, in front of any
   firewalls, will give external parties a good indication of the
   performance to the demarcation point of your network.

 * Machines located inside of a site border, with firewalls in the
   path, will give external parties a good indication of performance
   within your network.  Note that this is vastly different than the
   previous case, and could give different results.

 * If your facility has centralized computing, storage, research
   activity, or a science DMZ, it is recommended that a perfSONAR node
   be placed here as a service to external users that may use these
   facilities.  This location would be paramount for supporting these
   users, and isolating end to end problems.  Locating a machine at
   the border is more valuable from a networking perspective, to test
   the SLA agreements that are in place with WAN providers.

{% include image.html file="deploy/placement/global.png" alt="Global placement considerations" %}
