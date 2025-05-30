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

## Current Release

{% for release in releases %}
  {% if release.supported and release.beta == false %}
   * [{{ release.version }}]({{ release.url | remove: "/" }}) - {{ release.date | date: "%B %e, %Y" }} - [Get Started](https://docs.perfsonar.net/install_options.html)
  {% endif %}
{% endfor %}


{% for release in releases %}
  {% if release.supported and release.beta %}
## Beta Release

{% include warning.html content="This release is <b>beta</a> and is not intended for use in production." %}

   * [{{ release.version }}]({{ release.url | remove: "/" }}) - {{ release.date | date: "%B %e, %Y" }} - [Get S\
tarted](https://docs.perfsonar.net/install_rcs.html)
   {% break %}
  {% endif %}
{% endfor %}

## Past Releases

{% include warning.html content="These releases are <b>no longer supported</b>.  New systems should be built with the current release and upgrading existing ones is strongly-recommended.  Patches to fix security problems in these releases may be released at the development team's discretion." %}

{% for release in releases %}
  {% if release.supported == false %}
 * [{{ release.version }}]({{ release.url | remove: "/" }}) - {{ release.date | date: "%B %e, %Y" }}
  {% endif %}
{% endfor %}
 * All versions of perfSONAR prior to those listed here
