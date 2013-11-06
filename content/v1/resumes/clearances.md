---
title: Security Clearances | TAP API
---

# Security Clearances API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List clearances on a resume

Get a candidate's clearances listed on their resume

    GET /candidates/:candidate_id/resume/clearances

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_clearance) { |h| [h] } %>

## Get a single clearance

    GET /candidates/:candidate_id/resume/clearances/:clearance_id

### Response

<%= headers 200 %>
<%= json :resume_clearance %>

## Create an clearance

Create a new clearance.

    POST /candidates/:candidate_id/resume/clearances

### Input

description
: _Required_ **string**

source
: _Required_ **string**

start_date
: _Required_ **string** - Date this clearance took effect

end_date
: _Required_ **string** - Date this clearance expires

<%= json \
    :description   => "Top Secret",
    :source        => "National Security Agency",
    :start_date    => "2011-01-01",
    :end_date      => "2013-12-31"
%>

### Response

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/clearances/2894c358-f2d0-4a3f-952f-5afdb8dd81aa" %>
<%= json :resume_clearance %>

## Update an clearance

Update the provided clearance.

    PATCH /candidates/:candidate_id/resume/clearances/:clearance_id

### Input

description
: _Required_ **string**

source
: _Required_ **string**

start_date
: _Required_ **string** - Date this clearance took effect

end_date
: _Required_ **string** - Date this clearance expires

<%= json \
    :description   => "Top Secret",
    :source        => "National Security Agency",
    :start_date    => "2011-01-01",
    :end_date      => "2013-12-31"
%>

### Response

<%= headers 200 %>
<%= json :resume_clearance %>

## Delete an clearance

Delete the provided clearance.

    DELETE /candidates/:candidate_id/resume/clearances/:clearance_id

### Response

<%= headers 204 %>
