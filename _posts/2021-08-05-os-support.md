---
title: "Statement on Operating System Support"
categories: news
permalink: post-2021-08-05-os-support.html
tags: [news]
---

As many of you are aware, Red Hat announced last December that all
support for CentOS 8 will cease on December 31, 2021.  At the time of
the announcement, the perfSONAR team was in the process of a
long-overdue port to that distribution; that project was halted
pending an assessment of the post-CentOS landscape.  During our recent
developer meeting, the team had some discussions and would like to
share the decisions made about operating system support:

CentOS 7 will continue to be fully-supported until its
originally-scheduled end of life on June 30, 2024.

[Alma Linux 8](https://almalinux.org) will become fully-supported and
the team’s primary environment for development, build and
distribution.  Our RPM repositories and ISO images will be built using
this distribution.  The first Alma-based release will be perfSONAR
5.0.

[Rocky Linux 8](https://rockylinux.org) has a small amount of catching
up to do relative to Alma but is shaping up to be a solid alternate.
As it should be bug-compatible with Red Hat Enterprise Linux, we will
be revisiting it regularly and anticipate supporting running the
Alma-built RPMs there.

Red Hat Enterprise Linux 8 and Oracle Linux 8 will be supported on an
advisory-only basis.  This means the team may pass along any
information arising from informal experimentation or reports from the
community.  Supporting these distributions will not be a priority,
although we will integrate patches from the community that make
perfSONAR work there and don’t cause problems for those we do support.

CentOS Stream will not be supported, but we may use it internally
as a way to make support for distributions derived from Red Hat
Enterprise Linux 9 more timely.

CentOS 8 will not be supported in any fashion.

There are no changes in current or future support for Debian and
Ubuntu.  There is work underway to make both first-class citizens in
our development environment rather than the ports they have been
previously.  This should make perfSONAR on those distributions a
better product.

We will, as always, have documentation and programs available to help
with the migration from CentOS 7 to the new systems.

If you have questions or concerns, please drop us a line at
[perfsonar-developer@internet2.edu](mailto:perfsonar-developer@internet2.edu).
