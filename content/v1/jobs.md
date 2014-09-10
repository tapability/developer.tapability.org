---
title: Jobs | TAP API
---

# Jobs API

* TOC
{:toc}

## List owned jobs

_This endpoint is only available to employers_

List all jobs created by you.

    GET /me/jobs

## List all jobs

List all jobs across all users.

    GET /jobs

### Parameters

sort
: `created_at`, `updated_at`, `title`, default: `created_at`.

direction
: `asc` or `desc`, default: `desc`

## List employer jobs

List jobs owned by the specified employer.

    GET /employers/:employer_id/jobs

### Parameters

sort
: `created_at`, default: `created_at`.

direction
: `asc` or `desc`, default: `desc`

## List nearby jobs

    GET /jobs/:latitude/:longitude

### Parameters

sort
: `created_at`, `updated_at`, `title`, default: `created_at`.

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

## Create a job

_This endpoint is only available to employers_

Create a new job for the authenticated user.

    POST /jobs

### Input

title
: _Required_ **string**

description
: _Required_ **string**

category_name
: _Required_ **string** - must be a valid category name, full list available in the Categories API

code
: _Required_ **string**

street1
: _Optional_ **string**

street2
: _Optional_ **string**

city
: _Required_ **string**

state
: _Required_ **string**

zip
: _Optional_ **string**

coordinates
: _Optional_ **array** - must contain valid latitude and longitude as floats

apply_url
: _Required_ **string**

<%= json \
    :code          => "MIFLIN0001",
    :title         => "Assistant Regional Manager",
    :description   => "Actually, it's Assistant TO the Regional Manager",
    :category_name => "Sales",
    :city          => "Scranton",
    :state         => "Pennsylvania",
    :coordinates   => [32.7993,-117.16],
    :apply_url     => "http://www.dundermiflin.com/jobs/arm"
%>

### Response

<%= headers 201, :Location => "https://tapability.org/api/v1/jobs/a3338736-ffcd-472e-9b82-b7ca38eaa355" %>
<%= json :job_authenticated %>

## Update a job

_This endpoint is only available to employers_

Update the provided job.

    PATCH /jobs/:job_id

### Input

title
: _Required_ **string**

description
: _Required_ **string**

code
: _Required_ **string**

apply_url
: _Required_ **string**

<%= json \
    :code        => "MIFLIN0001",
    :title       => "Assistant Regional Manager",
    :description => "Actually, it's Assistant TO the Regional Manager",
    :apply_url   => "http://www.dundermiflin.com/jobs/arm"
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
<%= json :job_authenticated_expired %>

## Delete a job

_This endpoint is only available to employers_

Delete the provided job.

    DELETE /jobs/:job_id

### Response

<%= headers 204 %>
