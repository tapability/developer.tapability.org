---
title: Locations | TAP API
---

# Locations API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

Many of the endpoints below require a US state as input. States must precisely match one from the following list. Specifying an invalid state will result in a `422 Unprocessable Entity` response.

<%= json(:states) %>

## List locations on a resume

Get a candidate's available work locations

    GET /candidates/:candidate_id/resume/locations

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_location) { |h| [h] } %>

## Create a location

Create a new location.

_Note: you can provide any US city and state here, but if we do not have any existing entries with the supplied city, you will not immediately receive geographic coordinates. Coordinates for new cities are determined asyncronously on our servers. If you need the coordinates immediately, perform a subsequent GET a few seconds after creating. Major cities will return coordinates immediately._

    POST /candidates/:candidate_id/resume/locations

### Input

city
: _Required_ **string**

state
: _Required_ **string**

distance
: _Optional_ **integer** - miles from the center of this city where the candidate is willing to work, defaults to 10

<%= json \
    :city     => "San Diego",
    :state    => "California",
    :distance => 10
%>

### Response

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/locations/8a58f89e-d8fe-4477-aeaf-fe37f7c86e8c" %>
<%= json :resume_location %>

## Delete a location

Delete the provided location.

    DELETE /candidates/:candidate_id/resume/locations/:location_id

### Response

<%= headers 204 %>
