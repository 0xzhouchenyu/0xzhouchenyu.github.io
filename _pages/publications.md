---
layout: page
permalink: /publications/
title: publications
description: publications by categories in reversed chronological order.
nav: true
nav_order: 1
---
<!-- _pages/publications.md -->
<div class="publications">

{% bibliography --group_by type,year --sort type:desc,year:desc  --file {{ site.scholar.bibliography }} %}
</div>
