---
title: Use Cases
keywords: use cases success stories
toc: true
permalink: use_cases.html
folder: about
sidebar: home_sidebar
comments: false
---
## NRAO and SARAO MTU Troubleshooting
 In Fall 2021, low throughput of data sharing from the National Radio Astronomy Observatory (NRA), located on the University of Virginia campus, to the South African Radio Astronomy Observatory (SARAO) triggered a series of troubleshooting steps that led to a discovery of a troubleshooting problem. See the report [here](/pdf/usecases-panstarrs.pdf) for an in depth look at the steps used to find a path MTU problem causing the issue. 

## Pan-STARRS Hawaii to Queen's University Belfast
Around August 6, 2020 a Pan-STARRS researcher reported a backlog on their DTN transfers from Hawaii to Queens University Belfast due to poor throughput. The MaDDash (https://astrodash.ps.uhnet.net) clearly showed poor throughput to these hosts, including the furthest east tests that started at a DTN in MAX. Sometimes throughput would be multiple-Gbps, other times it would fall below 10Mbps. There was also fractional loss observed which given the high latency of this path could have drastic effects on the performance. perfSONAR tests were used to an issue in the Janet network.

{% include image.html file="about/usecases-panstarrs.png" %}

There were two parts to the fix, both clearly displayed on graphs above:

- On August 6th, 2020 an undersized buffer was found in Janet, that once increased raised the ceiling of the throughput but the problem still persisted. 
- On August 11, 2020 the information above was passed along to Janet operations and they were able to identify a LAG with errors on it. This LAG was removed on August 11, 2020 and the graphs immediately improved. 
