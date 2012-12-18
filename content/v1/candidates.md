---
title: Candidates | Tapability API
---

# Candidates API

* TOC
{:toc}

## Get my profile

_This endpoint is only available to candidates_

Get the currently logged in candidate's info

    GET /me

### Response

<%= headers 200 %>
<%= json :candidate_authenticated %>
