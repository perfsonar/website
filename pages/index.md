---
title: ""
keywords: sample homepage
# tags: [ home ]
sidebar: home_sidebar
permalink: index.html
# summary: perfSONAR is the <b>perf</b>ormance <b>S</b>ervice-<b>O</b>riented <b>N</b>etwork monitoring <b>AR</b>chitecture, a toolkit for identifying performance problems on your network.
toc: false
comments: false
---
{%- comment -%}
-------------------------------------------------------------------------------
			       RELEASE

This will show a release notice for 45 days after a new release note
is posted.
-------------------------------------------------------------------------------
{%- endcomment -%}
{% assign latest_release = site.releasenotes | last %}
{% capture epoch_now %}{{ "now" | date: '%s' }}{% endcapture %}
{% capture epoch_since %}{{ latest_release.date | date: '%s' }}{% endcapture %}
{% assign days_since = epoch_now | minus: epoch_since | divided_by: 86400 %}
{% if days_since < 14 %}
  {% assign release_message = "New Release" %}
{% elsif days_since < 45 %}
  {% assign release_message = "Recent Release" %}
{% else %}
  {% assign release_message = "Current Release" %}
{% endif %}
{% if days_since < 45 %}
  {% assign releasenote_url = latest_release.url | remove: "/" %}
  <p align="center">{{ release_message }}: <b><a href="{{ releasenote_url }}">{{ latest_release.version }}</a></b></p>
{% endif %}


{%- comment -%}
-------------------------------------------------------------------------------
				 NEWS

This will show a news notice for anything less than 60 days old.
-------------------------------------------------------------------------------
{%- endcomment -%}
{% capture epoch_now %}{{ "now" | date: '%s' }}{% endcapture %}
{% capture epoch_post %}{{ site.posts[0].date | date: '%s' }}{% endcapture %}
{% assign days_since = epoch_now | minus: epoch_post | divided_by: 86400 %}
{% if days_since < 2 %}
  {% assign news_message = "This Just In" %}
{% elsif days_since < 14 %}
  {% assign news_message = "Latest News" %}
{% else %}
  {% assign news_message = "News" %}
{% endif %}
{% if days_since < 60 %}
  {% assign post_url = site.posts[0].url | remove: "/" %}
  <p align="center">{{ news_message }}: <b><a href="{{ post_url }}">{{ site.posts[0].title }}</a></b></p>
{% endif %}


{%- comment -%}
-------------------------------------------------------------------------------
				 LOGO
-------------------------------------------------------------------------------
{%- endcomment -%}
<p align="center"><img src="images/logos/perfsonar/perfsonar-logo-black-full.svg" /></p>


<!--
{% include important.html content="This is a development test for a potential replacement for the perfSONAR web site.  It is not the official site, so please take anything you see here with a grain of salt." %}
-->

{%- comment -%}
-------------------------------------------------------------------------------
			     DESCRIPTION
-------------------------------------------------------------------------------
{%- endcomment -%}

<p>perfSONAR is the <b>perf</b>ormance <b>S</b>ervice-<b>O</b>riented
<b>N</b>etwork monitoring <b>AR</b>chitecture, a network measurement
toolkit designed to provide federated coverage of paths, and help to
establish end-to-end usage expectations.  There are thousands of
perfSONAR instances deployed worldwide, many of which are available
for open testing of key measures of network performance.  This global
infrastructure helps to identify and isolate problems as they happen,
making the role of supporting network users easier for engineering
teams and increasing productivity when utilizing network
resources.</p>

{% include youtube.html id="EO2NiNaASYo" %}

<p>perfSONAR provides a uniform interface that allows for the
scheduling of measurements, storage of data in uniform formats, and
scalable methods to retrieve data and generate visualizations.  This
extensible system can be modified to support new metrics, and there
are endless possibilities for data presentation.</p>




