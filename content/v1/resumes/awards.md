---
title: Awards | Tapability API
---

# Awards API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List awards on a resume

Get a candidate's awards listed on their resume

    GET /candidates/:candidate_id/resume/awards

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_award) { |h| [h] } %>

## Get a single award

    GET /candidates/:candidate_id/resume/awards/:award_id

### Response

<%= headers 200 %>
<%= json :resume_award %>

## Create an award

Create a new award.

    POST /candidates/:candidate_id/resume/awards

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

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/awards/2894c358-f2d0-4a3f-952f-5afdb8dd81aa" %>
<%= json :resume_award %>

## Update an award

Update the provided award.

    PATCH /candidates/:candidate_id/resume/awards/:award_id

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
<%= json :resume_award %>

## Delete an award

Delete the provided award.

    DELETE /candidates/:candidate_id/resume/awards/:award_id

### Response

<%= headers 204 %>
