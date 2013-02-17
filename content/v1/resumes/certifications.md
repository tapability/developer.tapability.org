---
title: Certifications | Tapability API
---

# Certifications API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List certifications on a resume

Get a candidate's certifications listed on their resume

    GET /candidates/:candidate_id/resume/certifications

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_certification) { |h| [h] } %>

## Get a single certification

    GET /candidates/:candidate_id/resume/certifications/:certification_id

### Response

<%= headers 200 %>
<%= json :resume_certification %>

## Create a certification

Create a new certification.

    POST /candidates/:candidate_id/resume/certifications

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

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/certifications/2894c358-f2d0-4a3f-952f-5afdb8dd81aa" %>
<%= json :resume_certification %>

## Update an certification

Update the provided certification.

    PATCH /candidates/:candidate_id/resume/certifications/:certification_id

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
<%= json :resume_certification %>

## Delete a certification

Delete the provided certification.

    DELETE /candidates/:candidate_id/resume/certifications/:certification_id

### Response

<%= headers 204 %>
