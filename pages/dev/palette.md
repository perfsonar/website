---
title: Color Palette
permalink: dev_palette.html
# summary: Scratchpad for experimentation
toc: false
comments: false

local:

  colors:

    - percent: 100
      value: "#ffffff"

    - percent: 95
      value: "#ebfaec"

    - percent: 90
      value: "#d7f4da"

    - percent: 85
      value: "#c3efc7"

    - percent: 80
      value: "#aeeab4"

    - percent: 75
      value: "#9ae4a2"

    - percent: 70
      value: "#86df8f"

    - percent: 65
      value: "#72da7c"

    - percent: 60
      value: "#5ed46a"

    - percent: 55
      value: "#4acf57"

    - percent: 50
      value: "#36c944"

    - percent: 45
      value: "#31b63f"
      application: "Crosshair Fill"

    - percent: 40
      value: "#2ba137"

    - percent: 35
      value: "#258d30"

    - percent: 30
      value: "#207929"

    - percent: 25
      value: "#1b6522"

    - percent: 20
      value: "#15511b"

    - percent: 15
      value: "#103c15"

    - percent: 10
      value: "#0b280e"

    - percent: 5
      value: "#051407"

    - percent: 0
      value: "#000000"

---

<table>
<tr>
  <th>Brightness</th>
  <th>Sample</th>
  <th>Background</th>
  <th>Text</th>
  <th>Application</th>
</tr>
{% for color in page.local.colors %}
<tr>
  <td>{{ color.percent }}</td>
  <td style="background: {{ color.value }};">
    {% if color.percent > 50 %}
      {% assign text_color = "#000000" %}
    {% else %}
      {% assign text_color = "#ffffff" %}
    {% endif %}
    <div style="color: {{ text_color }};"><b>perfSONAR</b></div>
  </td>
  <td><tt>{{ color.value }}</tt></td>
  <td><tt>{{ text_color }}</tt></td>
  <td>{{ color.application }}</td>
</tr>
{% endfor %}
</table>

#31b63f Is the "official" color that goes in the crosshairs.

## Samples

<h1>perfSONAR</h1>
<h2>perfSONAR</h2>
<h3>perfSONAR</h3>
<h4>perfSONAR</h4>

[This is a link.]()

| Column 1 | Column2 |
|----------|---------|
| Foo | Bar |
| Baz | Quux |
