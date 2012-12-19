---
title: Counselors | Tapability API
---

# Counselors API

* TOC
{:toc}

## Get my profile

_This endpoint is only available to counselors_

Get the currently logged in counselor's info.

    GET /me

### Response

<%= headers 200 %>
<%= json :counselor_authenticated %>

## List counselors

_This endpoint is only available to counselors_

List all counselors visible to the currently logged-in counselor.

    GET /counselors

### Parameters

sort
: `created_at`, `updated_at`, `first_name`, `last_name`, default: `last_name`.

direction
: `asc` or `desc`, default: `asc`

### Response

<%= headers 200, :pagination => true %>
<%= json(:counselor) { |h| [h] } %>

## Get a single counselor

_This endpoint is only available to counselors_

Get a single counselor with their ID.

    GET /counselors/:counselor_id

### Response

<%= headers 200 %>
<%= json :counselor_full %>

## Create a new counselor

_This endpoint is only available to counselors_

Create a new counselor as a "child" counselor of the currently
logged-in counselor.

    POST /counselors

### Response

<%= headers 201, :location => "https://tapability.org/api/v1/counselors/ac300f35-61a0-49e4-85c2-5b283d876b31" %>
<%= json :counselor_full %>

## Edit a counselor

_This endpoint is only available to counselors_

Edit the profile attributes of a given counselor.

    PATCH /counselors/:counselor_id

### Response

<%= headers 200 %>
<%= json :counselor_full %>

## Delete a counselor

_This endpoint is only available to counselors_

Delete the provided counselor.

    DELETE /counselors/:counselor_id

### Response

<%= headers 204 %>
