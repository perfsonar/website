---
title: Release Notes
sidebar: home_sidebar
keywords: updates, release notes, announcements
permalink: docs_releasenotes.html
toc: false
folder: news
---

Information on how perfSONAR version numbers are assigned may be found
[here](https://github.com/perfsonar/project/wiki/Versioning).

{% assign releases = site.releasenotes | reverse %}
{% for release in releases %}
  {% if forloop.first %}
## Current Release
  {% elsif forloop.index == 2 %}
## Past Releases

{% include warning.html content="These releases are <b>no longer supported</b>.  New systems should be built with the current release and upgrading existing ones is strongly-recommended.  Patches to fix security problems in these releases may be released at the development team's discretion." %}

  {% endif %}
 * [{{ release.version }}]({{ release.url | remove: "/" }}) - {{ release.date | date: "%B %e, %Y" }}{% if forloop.first %} - [Get Started](http://docs.perfsonar.net/install_options.html){% endif %}
{% endfor %}
 * All versions prior to those listed here
