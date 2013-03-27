---
title: Categories | Tapability API
---

# Categories API

* TOC
{:toc}

These are read-only API endpoints for fetching information about job and resume categories

## List categories

List all job and resume categories. Unlike most other collection endpoints, this list is not paginated. It always returns all categories.

    GET /categories

### Response

<%= headers 200 %>
<%= json(:categories) } %>
