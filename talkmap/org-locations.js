---
layout: null
# layout:null is REQUIRED — it outputs raw JS. Without it the site's default
# `single` layout (set in _config.yml defaults) wraps this file in the full
# HTML page, so <script src="org-locations.js"> fails and no markers appear.
#
# The marker list is generated from every entry in _talks, grouped by `venue:`
# so each conference/event gets one marker listing all of its talks. The
# event's `location:` (taken from its first talk) is resolved to coordinates
# via _data/locations.yml. Add a talk (or a new city in locations.yml) and it
# appears on the map automatically.
---
var talkEvents = [
{% assign talks = site.talks | sort: "date" -%}
{% assign events = talks | group_by: "venue" -%}
{% for event in events -%}
{% assign first = event.items | first -%}
{% assign loc = site.data.locations[first.location] -%}
{% if loc -%}
  {
    venue: {{ event.name | jsonify }},
    location: {{ first.location | jsonify }},
    lat: {{ loc[0] }},
    lng: {{ loc[1] }},
    talks: [
{% for post in event.items -%}
      {title: {{ post.title | jsonify }}, type: {{ post.type | jsonify }}, date: {{ post.date | date: "%-d %b %Y" | jsonify }}, url: {{ post.url | relative_url | jsonify }}},
{% endfor -%}
    ]
  },
{% endif -%}
{% endfor -%}
];
