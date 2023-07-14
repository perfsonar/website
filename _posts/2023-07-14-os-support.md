---
title: "Statement on Operating System Support, 2023 Edition"
categories: news
permalink: post-2023-07-14-os-support.html
tags: [news]
---

NB:  This is not a re-post from two years ago.

Last week, Red Hat announced that it has ceased distributing the
source code for Red Hat Enterprise Linux to the public and barred its
licensees from doing the same.  This closes the loophole it left open
that made Alma Linux and Rocky Linux (and, originally, CentOS)
possible, or at least easier, in the first place.  The maintainers of
Alma and Rocky have indicated that Red Hat’s actions make their
ability to maintain them more-complicated but should only have a minor
impact on their release processes.

For our part:

Support for CentOS 7 will continue until it reaches end of life next
June.

Support for perfSONAR on Alma and Rocky in their EL8 and EL9 flavors
remains unchanged.  While that support is currently considered beta,
we will remove that designation once those builds have seen
wide-enough use outside the development team to be considered stable.
We do not anticipate major problems with either.  Red Hat Enterprise
Linux and Oracle Linux will continue to be supported on an
advisory-only basis.  This means the team may pass along any
information arising from informal experimentation or reports from the
community. Supporting these distributions will not be a priority,
although we will integrate patches from the community that make
perfSONAR work there and don’t cause problems for the
officially-supported distributions.

Support for any forks of RHEL will be considered if they turn into
viable distributions and the perfSONAR community appears to be headed
for a critical mass of adopting them.

Our support for Debian and its derivatives will remain unchanged.  As
part of an upcoming reorganization of our Docker containers, we may
start basing them on a Debian-derived distribution to avoid
instability caused by upheaval in the EL-derived world.

The perfSONAR team has an in-person developers’ meeting scheduled for
late next month, and this will be a topic of discussion.  While we
understand that, like two years ago, most of you are still trying to
find your way through this, early feedback on where you’re headed will
help us make decisions about what to support and get that support in
place in a timely manner.

As always, if you have questions or concerns, please drop us a line at
[perfsonar-developer@internet2.edu](mailto:perfsonar-developer@internet2.edu).
