---
# Front matter makes Jekyll render this file: the marker list is generated
# from every entry in _talks, resolving each `location:` to coordinates via
# _data/locations.yml. Add a talk (or a new city in locations.yml) and it
# appears on the map automatically — no manual editing of this file.
---
var addressPoints = [
{% assign talks = site.talks | sort: "date" | reverse -%}
{% for post in talks -%}
{% assign loc = site.data.locations[post.location] -%}
{% if loc -%}
  [{{ post.title | jsonify }}, {{ loc[0] }}, {{ loc[1] }}],
{% endif -%}
{% endfor -%}
];
