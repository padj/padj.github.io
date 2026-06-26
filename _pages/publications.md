---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

{% assign pubs = site.publications | sort: 'date' | reverse %}
{% capture year_list %}{% for post in pubs %}{{ post.date | date: '%Y' }},{% endfor %}{% endcapture %}
{% assign years = year_list | split: ',' | uniq %}

<div class="pub-filter" role="group" aria-label="Filter publications by year">
  <button type="button" class="pub-filter__btn is-active" data-year="all">All</button>
  {% for y in years %}{% if y != '' %}<button type="button" class="pub-filter__btn" data-year="{{ y }}">{{ y }}</button>{% endif %}{% endfor %}
</div>

<div class="pub-list">
  {% for post in pubs %}
    <div class="pub-item" data-year="{{ post.date | date: '%Y' }}">
      {% include archive-single.html %}
    </div>
  {% endfor %}
</div>

<script>
  (function () {
    var buttons = document.querySelectorAll('.pub-filter__btn');
    var items = document.querySelectorAll('.pub-item');
    if (!buttons.length || !items.length) { return; }
    function apply(year) {
      items.forEach(function (item) {
        var match = (year === 'all') || (item.getAttribute('data-year') === year);
        item.style.display = match ? '' : 'none';
      });
    }
    buttons.forEach(function (btn) {
      btn.addEventListener('click', function () {
        buttons.forEach(function (b) { b.classList.remove('is-active'); });
        btn.classList.add('is-active');
        apply(btn.getAttribute('data-year'));
      });
    });
  })();
</script>
