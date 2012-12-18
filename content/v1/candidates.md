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

## List candidates

_This endpoint is only available to counselors_

List all candidates visible to the currently logged-in counselor.

    GET /candidates

### Parameters

sort
: `created_at`, `updated_at`, `first_name`, `last_name`, default: `last_name`.

direction
: `asc` or `desc`, default: `asc`

### Response

<%= headers 200, :pagination => true %>
<%= json(:candidate) { |h| [h] } %>

## Get a single candidate

_This endpoint is only available to counselors_

Get a single candidate with their ID.

    GET /candidates/:candidate_id

### Response

<%= headers 200 %>
<%= json :candidate_full %>

## Edit a candidate

_This endpoint is only available to counselors_

Edit the profile attributes of a given candidate.

    PATCH /candidates/:candidate_id

### Response

<%= headers 200 %>
<%= json :candidate_full %>

## Archive a candidate

_This endpoint is only available to counselors_

Archive the provided candidate so they are not listed with current cases.

    POST /candidates/:candidate_id/archive

### Response

<%= headers 200 %>
<%= json :candidate_full_archived %>

## Delete a candidate

_This endpoint is only available to counselors_

Delete the provided candidate

    DELETE /candidates/:candidate_id

### Response

<%= headers 204 %>
