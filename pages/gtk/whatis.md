---
title: "What is perfSONAR?"
keywords: about
#tags: []
sidebar: home_sidebar
permalink: gtk_whatis.html
toc: true
---

## Introduction

Networks are vital to research disciplines.  Collaboration and data
mobility rely heavily on network infrastructure, and almost always
cross administrative domains.  Ensuring that things are operating
well, on an end-to-end basis, is critical.  Monitoring within a single
domain is a common and accepted practice; cross-domain performance
monitoring is difficult to do with traditional tools.  perfSONAR is a
widely-deployed test and measurement infrastructure that is used by
science networks and facilities around the world to monitor and ensure
network performance.

{% include image.html file="gtk/whatis/introduction.png" alt="Multi-Domain Networking" %}


## Design of Networks

Networks are designed as components of a larger system.  Heterogeneous
mixtures of hardware and protocols are the norm, especially in large
collaborations.  Interoperability takes precedence in most cases,
along with local control and policy being preserved.  Because of this,
actions taken by one organization can affect the performance of users
in another organization.  A global monitoring framework is required in
order to reliably discover and mitigate these issues.

{% include image.html file="gtk/whatis/design.png" alt="Network Design" %}


## The End-to-End Problem

Networking use cases span this complex environment of providers,
paths, protocols, applications and user expectations.  It is uncommon
to have visibility into why things work well, or perform poorly.
While monitoring things internally is standard, why is it rare to
monitor performance into the networks of providers or collaborators?
This missing viewpoint hurts network users most of all, as they are
the first to stumble upon problems that are exacerbated when latency
and paths increase, and protocols react adversely.

{% include image.html file="gtk/whatis/end-to-end.png" alt="End-to-End Networking" %}


## Soft Failures

What makes a network run slowly?  Factors such as congestion can cause
fair protocols, such as TCP, to moderate their performance.
Infrastructure flaws, such as damaged cabling or hardware, can
introduce errors that must be corrected.  Configuration that doesn't
account for network buffering is also common, along with applications
not designed for high performance.  The problems are numerous, span
all layers of the definition of a network, and may exist at any
portion of an end-to-end path.

{% include image.html file="gtk/whatis/soft-failures.png" alt="Soft Failures" %}


## Stakeholders

There are many actors involved in the operation and use of a network.
An end user simply wants their use to work without it feeling slow;
their productivity is tied to a well functioning network.
Collaborations have goals for data mobility and reliability, and it is
common that these parties do not directly control the networking
resources they use.  Network maintainers serve these use cases, but
are focused on ensuring that their own infrastructure is working well;
it is challenging, if not impossible, to ensure that end-to-end
workflows are performing well unless there is participation from all
members on a path.

{% include image.html file="gtk/whatis/stakeholders.png" alt="Stakeholders" %}


## Problem Statement and Solution

Identification of problems, when they happen, is best served by active
measurement against a predefined notion of success.  The performance
probes that perform the measurements must be available along paths of
interest: at campus endpoints, demarcations between networks, within
carrier points of presence, at exchange points, and near data
resources such as storage and computing elements.  Access to these
resources for testing, as well as the data they produce, should be
open to the science community to facilitate a deeper understanding of
expectations and faster problem resolution.

{% include image.html file="gtk/whatis/problem-statement.png" alt="Problem Statement" %}


## perfSONAR

perfSONAR is a network measurement toolkit designed to provide
federated coverage of paths, and help to establish end-to-end usage
expectations.  There are 1000s of perfSONAR instances deployed world
wide, many of which are available for open testing of key measures of
network performance.  This global infrastructure helps to identify and
isolate problems as they happen, making the role of supporting network
users easier for engineering teams, and increasing productivity when
utilizing network resources.

{% include image.html file="gtk/whatis/perfsonar.png" alt="perfSONAR" %}

perfSONAR provides a uniform interface that allows for the scheduling of
measurements, storage of data in uniform formats, and scalable methods
to retrieve data and generate visualizations.  This extensible system
can be modified to support new metrics, and there are endless
possibilities for data presentation. 

{% include image.html file="gtk/whatis/perfsonar2.png" alt="perfSONAR" %}


## perfSONAR Podcast

The perfSONAR project collaborated on a podcast with RCE (Research
Computing and Engineering), a group that explores topics relevant to the
High Performance Computing and Research Computing communities. This
podcast offers an introduction to perfSONAR, as well as discussion about
what the future holds.  It is \~45 minutes in length, and can be found
here:

[http://www.rce-cast.com/Podcast/rce-99-perfsonar.html](http://www.rce-cast.com/Podcast/rce-99-perfsonar.html)
