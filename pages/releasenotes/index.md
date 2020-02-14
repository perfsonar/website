---
title: Release Notes
sidebar: home_sidebar
keywords: updates, release notes, announcements
permalink: releasenotes_index.html
toc: false
folder: news

local:

  # Sort this with the most-recent version first.
  releases:
    - 4.2.2
    - 4.2.1
    - 4.2.0
    - 4.2.0b1
    - 4.1.6
    - 4.1.5
    - 4.1.4
    - 4.1.3
    - 4.1.2
    - 4.1.1
    - 4.1
    - 4.1b1
    - 4.0.2.5
    - 4.0.2.4
    - 4.0.2.3
    - 4.0.2.2
    - 4.0.2.1
    - 4.0.2
    - 4.0.1
    - 4.0.1rc1
    - 4.0
    - 4.0rc3
    - 4.0rc2
    - 4.0rc1

---

{% for release in page.local.releases %}
 * [perfSONAR {{ release }}](releasenotes_{{release}}.html)
{% endfor %}


