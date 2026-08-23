---
layout: page
permalink: /talks/
title: talks
description: selected talks, seminars, and conference presentations.
nav: true
nav_order: 4
---

<style>
  .talks-page {
    margin-top: 1.25rem;
  }

  .talks-page .talks-year {
    display: grid;
    grid-template-columns: 5.25rem minmax(0, 1fr);
    gap: 1.5rem;
    margin: 1.5rem 0 2rem;
  }

  .talks-page .talks-year-label {
    padding-top: 0.2rem;
    color: var(--global-theme-color);
    font-size: 1.4rem;
    font-weight: 600;
    line-height: 1;
    text-align: right;
  }

  .talks-page .talks-list {
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 0.85rem;
    min-width: 0;
    padding-left: 1.25rem;
    border-left: 1px solid var(--global-divider-color);
  }

  .talks-page .talk-card {
    position: relative;
    display: grid;
    grid-template-columns: 4.75rem minmax(0, 1fr);
    gap: 1rem;
    padding: 1rem 1.1rem;
    background: var(--global-card-bg-color);
    border: 1px solid var(--global-divider-color);
    border-radius: 8px;
    transition:
      border-color 0.15s ease,
      box-shadow 0.15s ease,
      transform 0.15s ease;
  }

  .talks-page .talk-card::before {
    position: absolute;
    top: 1.35rem;
    left: -1.55rem;
    width: 0.6rem;
    height: 0.6rem;
    content: "";
    background: var(--global-bg-color);
    border: 2px solid var(--global-theme-color);
    border-radius: 50%;
  }

  .talks-page .talk-card:hover {
    transform: translateY(-1px);
    border-color: var(--global-theme-color);
    box-shadow: 0 0.35rem 1.2rem rgba(0, 0, 0, 0.06);
  }

  html[data-theme="dark"] .talks-page .talk-card:hover {
    box-shadow: none;
  }

  .talks-page .talk-date {
    color: var(--global-text-color-light);
    font-size: 0.72rem;
    font-weight: 600;
    line-height: 1.2;
    text-transform: uppercase;
    letter-spacing: 0;
    white-space: nowrap;
  }

  .talks-page .talk-date strong {
    display: block;
    margin-top: 0.1rem;
    color: var(--global-text-color);
    font-size: 1.02rem;
    font-weight: 600;
    text-transform: none;
  }

  .talks-page .talk-body {
    min-width: 0;
  }

  .talks-page .talk-title {
    margin-bottom: 0.35rem;
    color: var(--global-text-color);
    font-size: 1.05rem;
    font-weight: 650;
    line-height: 1.35;
  }

  .talks-page .talk-meta {
    display: flex;
    flex-wrap: wrap;
    gap: 0.25rem 0.65rem;
    color: var(--global-text-color-light);
    font-size: 0.92rem;
    line-height: 1.45;
  }

  .talks-page .talk-venue {
    color: var(--global-text-color);
    font-weight: 500;
  }

  .talks-page .talk-type {
    color: var(--global-theme-color);
  }

  .talks-page .talk-description {
    margin-top: 0.5rem;
    color: var(--global-text-color-light);
    font-size: 0.92rem;
    line-height: 1.5;
  }

  .talks-page .talk-links {
    display: flex;
    flex-wrap: wrap;
    gap: 0.45rem;
    margin-top: 0.75rem;
  }

  .talks-page .talk-link {
    display: inline-flex;
    align-items: center;
    min-height: 1.8rem;
    padding: 0.22rem 0.7rem;
    color: var(--global-text-color);
    font-size: 0.78rem;
    font-weight: 500;
    line-height: 1.2;
    border: 1px solid var(--global-divider-color);
    border-radius: 4px;
  }

  .talks-page .talk-link:hover {
    color: var(--global-hover-text-color);
    text-decoration: none;
    background: var(--global-theme-color);
    border-color: var(--global-theme-color);
  }

  @media (max-width: 575px) {
    .talks-page .talks-year {
      display: block;
      margin-top: 1.75rem;
    }

    .talks-page .talks-year-label {
      margin-bottom: 0.85rem;
      text-align: left;
    }

    .talks-page .talk-card {
      grid-template-columns: 1fr;
      gap: 0.55rem;
      padding: 0.95rem;
    }

    .talks-page .talk-date {
      display: flex;
      gap: 0.4rem;
      align-items: baseline;
    }

    .talks-page .talk-date strong {
      display: inline;
      margin-top: 0;
      font-size: 0.9rem;
    }
  }
</style>

<div class="talks-page">
  {% assign talks_by_year = site.data.talks | group_by: "year" %}
  {% assign sorted_years = talks_by_year | sort: "name" | reverse %}

  {% for year_group in sorted_years %}
    <section class="talks-year" aria-labelledby="talks-year-{{ year_group.name }}">
      <h2 id="talks-year-{{ year_group.name }}" class="talks-year-label">{{ year_group.name }}</h2>
      <div class="talks-list">
      {% assign talks = year_group.items | sort: "date" | reverse %}
      {% for talk in talks %}
        <article class="talk-card">
          <div class="talk-date">
            {% if talk.date %}
              <span>{{ talk.date | date: "%b" }}</span>
              <strong>{{ talk.date | date: "%Y" }}</strong>
            {% elsif talk.display_date %}
              <span>{{ talk.display_date }}</span>
            {% endif %}
          </div>

          <div class="talk-body">
            <div class="talk-title">{{ talk.title }}</div>
            <div class="talk-meta">
              <span class="talk-venue">{{ talk.venue }}</span>
              {% if talk.location %}
                <span>{{ talk.location }}</span>
              {% endif %}
              <span class="talk-type">{{ talk.type | default: "Talk" }}</span>
            </div>

            {% if talk.description %}
              <div class="talk-description">{{ talk.description }}</div>
            {% endif %}

            <div class="talk-links">
              {% if talk.slides %}
                {% if talk.slides contains '://' %}
                  <a href="{{ talk.slides }}" class="talk-link">Slides</a>
                {% else %}
                  <a href="{{ talk.slides | prepend: '/assets/pdf/' | relative_url }}" class="talk-link">Slides</a>
                {% endif %}
              {% endif %}
              {% if talk.paper %}
                <a href="{{ talk.paper }}" class="talk-link">Paper</a>
              {% endif %}
              {% if talk.website %}
                <a href="{{ talk.website }}" class="talk-link">Website</a>
              {% endif %}
              {% if talk.video %}
                <a href="{{ talk.video }}" class="talk-link">Video</a>
              {% endif %}
              {% if talk.links %}
                {% for link in talk.links %}
                  <a href="{{ link.url }}" class="talk-link">{{ link.label }}</a>
                {% endfor %}
              {% endif %}
            </div>
          </div>
        </article>
      {% endfor %}
      </div>
    </section>
  {% endfor %}
</div>
