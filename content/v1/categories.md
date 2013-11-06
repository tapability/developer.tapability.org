---
title: Categories | TAP API
---

# Categories API

* TOC
{:toc}

These are read-only API endpoints for fetching information about job and resume categories.

## List categories

List all job and resume categories ordered alphabetically by name. Unlike most other collection endpoints, this list is not paginated and does not provide any options for sorting. It always returns all categories.

    GET /categories

### Response

<%= headers 200 %>
<%= json(:categories) %>
