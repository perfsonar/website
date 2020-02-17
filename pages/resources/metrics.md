---
title: "Introduction to Network Metrics"
keywords: metrics
#tags: []
sidebar: home_sidebar
permalink: resources_metrics.html
toc: false
---

## What are metrics?

Metrics are a quantitative and qualitative way to verify a desired
behavior.  For instance many operators like to measure their "uptime",
a count of how often services are available for users.  Network
metrics are similar, and are related to desired outcomes.  Some
measurements include:

 * **Network capacity** can be described as "how much" traffic can cross a
   given link, segment, or aggregated path.

 * **Network utilization** is a measurement of how much of the capacity is
   currently in use.

 * **Throughput** (sometimes called _achievable bandwidth_) is a
   measure of how much of the network can be used at a given time.
   This can be thought of as a form of inverse of the utilization and
   is often measured for paths versus individual segments.

 * **One-way latency** is a measure of how long data takes to travel
   from one host to another.

 * **Round-trip time** (or _two-way latency_) is the measure of how
   long data takes to travel from one host to another and back to the
   first host.

 * **Packet loss** is a measurement of how many packets are dropped
   for any reason on a network segment or path.

 * **Packet duplication** is a measure of how many packets are
   duplicated for any reason on a network segment or path.

 * Jitter is the variation in arrival times for packets between two
   participating endpoints.


Defining network metrics that matter to an organization depend on the
use case.  If someone wants to perform the task of bulk data movement,
often it is desirable to have a path high throughput.  This implies
other desirable features:

 * Low (or zero) packet loss
 * Stable jitter
 * Low path utilization

The perfSONAR tools are able to measure some metrics, and can be
viewed together to provide a picture of what is capable on a network.


## Survey of Internet Performance Measurement Platforms

Vaibhav Bajpai of the Computer Networks and Distributed Systems (CNDS)
Lab at Jacobs University Bremen in Germany prepared a survey of
performance measurement platforms and standardization efforts.  The
article's abstract is as follows:

> A number of Internet measurement platforms have emerged in the last
> few years. These platforms have deployed thousands of probes at
> strategic locations within access and backbone networks and behind
> residential gateways. In this paper we provide a taxonomy of these
> measurement platforms on the basis of their deployment use-case. We
> describe these platforms in detail by exploring their coverage,
> scale, lifetime, deployed metrics and measurement tools,
> architecture and overall research impact. We conclude the survey by
> describing current standardization efforts to make large-scale
> performance measurement platforms interoperable.

This work can be found using the following links:

 * IEEE Library: [http://dx.doi.org/10.1109/COMST.2015.2418435](http://dx.doi.org/10.1109/COMST.2015.2418435)

 * Mirrored Copy: [http://vaibhavbajpai.com/documents/papers/proceedings/lsmp-comst-2015.pdf](http://vaibhavbajpai.com/documents/papers/proceedings/lsmp-comst-2015.pdf)
