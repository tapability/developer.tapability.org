---
title: Employers | Tapability API
---

# Employers API

* TOC
{:toc}

## Get my profile

_This endpoint is only available to employers_

Get the currently logged in employer's info

    GET /me

### Response

<%= headers 200 %>
<%= json :employer_authenticated %>

## List employers

List all employers in the system.

    GET /employers

### Parameters

sort
: `created_at`, `updated_at`, `name`, default: `name`.

direction
: `asc` or `desc`, default: `asc`

### Response

<%= headers 200, :pagination => true %>
<%= json(:employer) { |h| [h] } %>

## Get a single employer

Get a single employer with their ID.

    GET /employers/:employer_id

### Response

<%= headers 200 %>
<%= json :employer_full %>
