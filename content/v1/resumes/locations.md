---
title: Locations | Tapability API
---

# Locations API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List locations on a resume

Get a candidate's locations listed on their resume

    GET /candidates/:candidate_id/resume/locations

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_location) { |h| [h] } %>

## Get a single location

    GET /candidates/:candidate_id/resume/locations/:location_id

### Response

<%= headers 200 %>
<%= json :resume_location %>

## Create an location

Create a new location.

    POST /candidates/:candidate_id/resume/locations

### Input

description
: _Required_ **string**

source
: _Required_ **string**

date
: _Optional_ **string**

<%= json \
    :description => "Emmy - Best Actor",
    :source      => "Academy of Television Arts and Sciences",
    :date        => "2012-09-23"
%>

### Response

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/locations/2894c358-f2d0-4a3f-952f-5afdb8dd81aa" %>
<%= json :resume_location %>

## Update an location

Update the provided location.

    PATCH /candidates/:candidate_id/resume/locations/:location_id

### Input

description
: _Required_ **string**

source
: _Required_ **string**

date
: _Optional_ **string**

<%= json \
    :description => "Emmy - Best Actor",
    :source      => "Academy of Television Arts and Sciences",
    :date        => "2012-09-23"
%>

### Response

<%= headers 200 %>
<%= json :resume_location %>

## Delete an location

Delete the provided location.

    DELETE /candidates/:candidate_id/resume/locations/:location_id

### Response

<%= headers 204 %>
