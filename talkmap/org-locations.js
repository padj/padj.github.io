---
layout: null
# layout:null is REQUIRED — it outputs raw JS. Without it the site's default
# `single` layout (set in _config.yml defaults) wraps this file in the full
# HTML page, so <script src="org-locations.js"> fails and no markers appear.
#
# The marker list is generated from every entry in _talks, resolving each
# `location:` to coordinates via _data/locations.yml. Add a talk (or a new
# city in locations.yml) and it appears on the map automatically.
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
