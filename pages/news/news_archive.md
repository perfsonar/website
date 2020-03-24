---
title: News Archive
sidebar: home_sidebar
keywords: news, blog, updates, release notes, announcements
permalink: news_archive.html
toc: false
folder: news
---

{% assign last_year = "" %}
{% capture now %}{{ "now" | date: '%s' }}{% endcapture %}

{% for post in site.posts %}

  {% capture epoch %}{{ post.date | date: '%s' }}{% endcapture %}
  {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
  {% capture month %}{{ post.date | date: '%m' }}{% endcapture %}
  {% capture day %}{{ post.date | date: '%d' }}{% endcapture %}

  {% if now > epoch %}

    {% if year != last_year %}
## {{ year }}
      {% assign last_year = year %}
    {% endif %}

 * **{{post.date | date: '%B %-d' }}** - [{{post.title}}]({{ post.url | remove: "/" }})
  {% endif %}

{% endfor %}
