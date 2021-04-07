---
title: History
keywords: info history
toc: false
permalink: about_history.html
folder: about
sidebar: home_sidebar
comments: false
---
{% comment %}

All history items are in the _history collection.  Releases of 4.0rc1
and later are automagically merged in from the _releasenotes
collection and require no additional action.

{% endcomment %}



## Timeline

{% include image.html file="about/history-2001-2015.jpg" %}

{% include image.html file="about/history-2016-present.jpg" %}



## Detailed History

{% assign last_year = "" %}
{% capture now %}{{ "now" | date: '%s' }}{% endcapture %}

{% assign events = site.history | concat: site.releasenotes | sort: 'date' | reverse %}

{% for item in events %}

  {% if item.collection == "history" %}
    {% assign text = item.text %}
    {% assign special_months = true %}
  {% elsif item.collection == "releasenotes" %}
    {% assign url = item.url | remove: "/" %}
    {% assign text = "[perfSONAR " | append: item.version | append: " release](" | append: url | append: ")" %}
    {% assign special_months = false %}
  {% else %}
    {% assign text = "Unknown event" %}
  {% endif %}  


  {% capture epoch %}{{ item.date | date: '%s' }}{% endcapture %}
  {% capture year %}{{ item.date | date: '%Y' }}{% endcapture %}
  {% capture month %}{{ item.date | date: '%m' }}{% endcapture %}
  {% capture day %}{{ item.date | date: '%d' }}{% endcapture %}

  {% if now > epoch %}

    {% if year != last_year %}
### {{ year }}
      {% assign last_year = year %}
    {% endif %}

    {% if month == "01" and day == "01" and special_months %}
      {% assign date_format = "" %}
    {% else %}
      {% if month != "01" and day == "01" and special_months %}
        {% capture date_format = "" %}**{{item.date | date: '%B' }}** - {% endcapture %}
      {% else %}
        {% capture date_format = "" %}**{{item.date | date: '%B %-d' }}** - {% endcapture %}
      {% endif %}
    {% endif %}
 * {{ date_format }}{{ text }}
  {% endif %}

{% endfor %}
