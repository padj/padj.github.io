---
layout: archive
title: "Podcasts"
permalink: /podcasts/
author_profile: true
redirect_from: 
  - /podcast.html
---

I am a frequent guest on "Shaping the Future", a podcast hosted by Dr. Phil McEwan and Dr. Marc Evans, which discusses various health and economic topics. As these episodes are released, I'll include links and descriptions here. The podcast is available on [Spotify](https://open.spotify.com/show/3NppSSjeJD77YcKqxreOPA), Apple music, etc. 

## Podcast Appearances
{% include base_path %}
{% for post in site.podcast reversed %}
  {% include archive-single.html %}
{% endfor %}
