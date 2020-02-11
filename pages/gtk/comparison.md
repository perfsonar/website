---
title: "Comparison with Other Systems"
keywords: about
#tags: []
sidebar: home_sidebar
permalink: gtk_comparison.html
toc: false

# The data below is used to generate the tables on this page.

local:

 # These define the rows in the table.  The tags name the fields in
 # the "products" object below; the text is used to label the first
 # column in the row.

 headings:

   - tag: description
     text: Description

   - tag: type
     text: Type of Measurements

   - tag: userdef
     text: User-Defined Scheduled Measurements

   - tag: demand
     text: On-demand Measurements

   - tag: control
     text: Incoming Measurement Control

   - tag: target
     text: Measurement Target Control

   - tag: distribution
     text: Type of Distribution

   - tag: storagedist
     text: Measurement Data Storage Distribution

   - tag: storagearch
     text: Measurement Data Storage Architecture

   - tag: archiveaccess
     text: Access to Archive Measurements


 products:

   # This array is a list of the products for the comparisons.  Each
   # has an identifying tag, name, URL and a full set of the fields
   # listed above.  The perfSONAR product *must* be first.

   - tag: ps
     name: perfSONAR
     url:  https://www.perfsonar.net
     description: "Network measurement toolkit designed to provide federated coverage of network paths. It provides an interface that allows for the scheduling of measurements, storage of data and generate visualizations."
     type: "Throughput (TCP and UDP), round-trip time, one-way delay, one-way packet loss, network path"
     userdef: "Yes"
     demand: "Yes"
     control: "Yes; site-programmable"
     target: "Yes; site-programmable"
     distribution: "Software"
     storagedist: "Local or central; many archive types"
     storagearch: "Data stored in user infrastructure"
     archiveaccess: "Local or central web interface"
  
   - tag: atlas
     name: RIPE Atlas
     url:  https://atlas.ripe.net
     description: "Active measurement network from the RIPE NCC. It consists of measurement probes that run measurements in the RIPE Atlas system and report results to the central data collection components."
     type: "RTT to the first and second hops, ping to predetermined destinations, traceroute to predetermined destinations, DNS queries to root DNS servers, SSL queries to predetermined destinations."
     userdef: "Yes; Limited by a system of credits based on participation"
     demand: "Yes; Limited by a system of credits based on participation"
     control: "No"
     target: "Only to pre-defined RIPE hosts or other Atlas probes"
     distribution: "Hardware"
     storagedist: "Central"
     storagearch: "Data stored in service provider infrastructure"
     archiveaccess: "Central web interface"
  
   - tag: sam
     name: SamKnows
     tag: sam
     url: https://samknows.com/
     description: "Probes for the measuring end-user broadband performance (fixed-line and mobile). They execute a series of software tests over their broadband connection they are connected to. The results of these tests are reported securely up to hosted backend infrastructure."
     type: "Multi-threaded HTTP download speed, multi-threaded HTTP based upload speed, availability of the connection, jitter, latency (ICMP and UDP), packet loss (ICMP and UDP), DNS query resolution time, DNS query failure rate, web page loading time, web page loading failure rate, Video streaming performance."
     userdef: "No"
     demand: "No"
     control: "No"
     target: "Pre-defined hosts"
     distribution: "Software and hardware"
     storagedist: "Central"
     storagearch: "Data stored in service provider infrastructure"
     archiveaccess: "Central web interface"
  
   - tag: ring
     name: NLNOG RING
     url: https://ring.nlnog.net
     description: "The infrastructure of (virtual) machines available to its participants.  It offers ssh access to all servers which are part of the project to run custom scripts executing commands on all or a subset of the servers.  These scripts run from own machine or from one of other nodes."
     type: "RTT, traceroute, ssh and system tools from predetermined destinations to any other host."
     userdef: "No"
     demand: "Yes"
     control: "No"
     target: "Other RING hosts"
     distribution: "Software"
     storagedist: "N/A"
     storagearch: "N/A"
     archiveaccess: "N/A"

---

{% include todo.html content="This needs to be gone over for correctness" %}

This page attempts to draw a comparison between perfSONAR and other
popular performance monitoring and measurement systems.  The summary
may help to decide if perfSONAR will suit one's needs. Although this
description can be useful, first-hand experience is probably the best
way to compare different systems.

<ul id="profileTabs" class="nav nav-tabs">
{% for product in page.local.products %}
  {% if forloop.first == false %}
    {% if forloop.index0 == 1 %}
      <li class="active">
    {% else %}
      <li>
    {% endif %}
    <a href="#{{ product.tag }}" data-toggle="tab">{{ product.name }}</a></li>
  {% endif %}
{% endfor %}
</ul>

<div class="tab-content">
  {% for product in page.local.products %}
    {% if forloop.first == false %}
      {% if forloop.index == 2 %}
        <div role="tabpanel" class="tab-pane active" id="{{ product.tag }}">
      {% else %}
        <div role="tabpanel" class="tab-pane" id="{{ product.tag }}">
      {% endif %}
          <h2>perfSONAR vs. <a href="{{ product.url }}" target="_new">{{ product.name }}</a></h2>
          <table>
            <tr>
	      <th width="30%">&nbsp;</th>
	      <th width="35%">perfSONAR</th>
	      <th width="35%">{{ product.name }}</th>
            </tr>
            {% for heading in page.local.headings %}
	      <tr>
	        <td><b>{{ heading.text }}</b></td>
		<td>{{ page.local.products[0][heading.tag] }}</td>
		<td>{{ product[heading.tag] }}</td>
              </tr>
	    {% endfor %}
          </table>
        </div>
    {% endif %}
  {% endfor %}
</div>
