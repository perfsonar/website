---
title: Scratch
keywords: sample
# tags: [ home ]
sidebar: home_sidebar
permalink: scratch.html
# summary: Scratchpad for experimentation
toc: false
comments: false
---

Scratch.

{%- comment -%}
-------------------------------------------------------------------------------
			       RELEASE
-------------------------------------------------------------------------------
{%- endcomment -%}
{% assign latest_release = site.releasenotes | reverse | first %}
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
{% if days_since < 180 %}
<br/>
<p align="center">
  {% assign releasenote_url = latest_release.url | remove: "/" %}
  {{ release_message }}: 
  <b><a href="{{ latest_release.url | remove_first: "/" }}">{{ latest_release.version }}</a></b>
  ({{ latest_release.date | date: "%B %-d, %Y" }})
</p>
{% endif %}
