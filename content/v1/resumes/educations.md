---
title: Educations | Tapability API
---

# Educations API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List educations on a resume

Get a candidate's educations listed on their resume

    GET /candidates/:candidate_id/resume/educations

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_education) { |h| [h] } %>

## Get a single education

    GET /candidates/:candidate_id/resume/educations/:education_id

### Response

<%= headers 200 %>
<%= json :resume_education %>

## Create an education

Create a new education.

    POST /candidates/:candidate_id/resume/educations

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

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/educations/2894c358-f2d0-4a3f-952f-5afdb8dd81aa" %>
<%= json :resume_education %>

## Update an education

Update the provided education.

    PATCH /candidates/:candidate_id/resume/educations/:education_id

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
<%= json :resume_education %>

## Delete an education

Delete the provided education.

    DELETE /candidates/:candidate_id/resume/educations/:education_id

### Response

<%= headers 204 %>
