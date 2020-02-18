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

{% assign releases = site.releasenotes | where: "supported", true | reverse %}
{% for release in releases %}
  {% if forloop.first %}
## Current Release
  {% elsif forloop.index == 2 %}
## Past Releases

{% include important.html content="These releases are supported for <b>security patches only</b>.  If installing a new system, the current release is strongly recommended." %}

  {% endif %}
 * [{{ release.version }}]({{ release.url | remove: "/" }}) - {{ release.date | date: "%B %e, %Y" }}
{% endfor %}


## End-of-Life Releases

{% include warning.html content="These releases are <b>no longer supported</b>.  If you have a system running one of these versions, please upgrade it to the current release." %}

{% assign releases = site.releasenotes | where: "supported", false | reverse %}
{% for release in releases %}
 * [{{ release.version }}]({{ release.url | remove: "/" }}) - {{ release.date | date: "%B %e, %Y" }}
{% endfor %}


