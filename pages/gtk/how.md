---
title: "How does it work?"
keywords: about
#tags: []
sidebar: home_sidebar
permalink: gtk_how.html
toc: true
---

perfSONAR can be deployed in a number of ways to best suit the needs
of the operator.  As a beacon, perfSONAR provides value to others
around the world.  Simply deploying perfSONAR, providing basic
configuration to identify the resource, and allowing others to test to
the node in an open and unencumbered manner provides significant
value.  Backbone providers, regional networks, national networks, and
large campuses routinely follow this deployment pattern as a service
to their customers.  End sites can then create dashboard applications,
and incorporate the downstream node into their test sets.

{% include image.html file="gtk/how/how1.png" %}


perfSONAR functions as a “measurement island” in the default case, and
allows the operator to configure tests to other measurement points
around the world.  Using the built in directory services, locating
nodes in other domains is a trivial exercise done with a few clicks.
Once configured, built-in graphs are available to show performance
over time.

{% include image.html file="gtk/how/how2.png" %}


perfSONAR can be used to create a grouping of tests, more commonly
known as a “mesh”.  A shared configuration file written in the JSON
format can be created with a graphical tool, and published for other
hosts to download.  Each host then creates a set of tests to the other
members of the mesh based on the configuration.  Data can be stored on
each machine, or pushed to a central server running a dashboard
application.  This model is used by networking providers to show
performance characteristics between points of presence, as well as by
virtual organizations to understand performance between participating
locations.

{% include image.html file="gtk/how/how3.png" %}
