# README

Blogpost: https://caspg.com/blog/optimizing-full-text-search-with-postgres-materialized-view-in-rails

## Setup

```bash
rails db:create db:migrate db:seed
```

## How to generate postgres materialized view with scenic gem

```bash
rails generate scenic:view NAME --materialized
```
