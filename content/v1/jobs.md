---
title: Jobs | Tapability API
---

# Jobs API

* TOC
{:toc}

## List all jobs

List all jobs across all users.

    GET /jobs

### Parameters

sort
: `created`, `updated`, `name`, `date`, default: `date`.

direction
: `asc` or `desc`, default: `desc`

## List employer jobs

List jobs owned by the specified user.

    GET /employers/:employer/jobs

### Parameters

sort
: `created_at`, default: `created_at`.

direction
: `asc` or `desc`, default: `desc`

## List nearby jobs

    GET /jobs/:latitude/:longitude

### Parameters

sort
: `created`, `updated`, `name`, `date`, default: `date`.

direction
: `asc` or `desc`, default: `desc`

### Response

<%= headers 200, :pagination => true %>
<%= json(:job) { |h| [h] } %>

## Get a single job

    GET /jobs/:job_id

### Response

<%= headers 200 %>
<%= json :job_full %>

## Create an job

_This endpoint is only available to employers_

Create a new job for the authenticated user.

    POST /jobs

### Input

title
: _Required_ **string**

description
: _Required_ **string**

coordinates
: _Optional_ **array** - must contain valid latitude and longitude as floats

<%= json \
    :title       => "Assistant Regional Manager",
    :description => "",
    :coordinates => [32.7993,-117.16]
%>

### Response

<%= headers 201, :Location => "https://tapability.org/api/v1/jobs/a3338736-ffcd-472e-9b82-b7ca38eaa355" %>
<%= json :job_authenticated %>

## Update an job

_This endpoint is only available to employers_

Update the provided job.

    PATCH /me/jobs/:job_id

### Input

title
: _Required_ **string**

description
: _Required_ **string**

coordinates
: _Optional_ **array** - must contain valid latitude and longitude as floats

<%= json \
    :title       => "Assistant Regional Manager",
    :description => "",
    :coordinates => [32.7993,-117.16]
%>

### Response

<%= headers 200 %>
<%= json :job_authenticated %>

## Expire a job

_This endpoint is only available to employers_

Expired the provided job. This marks the job as no longer available for candidate applications.

    POST /jobs/:job_id/expire

### Response

<%= headers 200 %>
<%= json :job_authenticated %>

## Delete an job

_This endpoint is only available to employers_

Delete the provided job.

    DELETE /jobs/:job_id

### Response

<%= headers 204 %>
