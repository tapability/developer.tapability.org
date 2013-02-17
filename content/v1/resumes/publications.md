---
title: Publications | Tapability API
---

# Publications API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List publications on a resume

Get a candidate's publications listed on their resume

    GET /candidates/:candidate_id/resume/publications

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_publication) { |h| [h] } %>

## Get a single publication

    GET /candidates/:candidate_id/resume/publications/:publication_id

### Response

<%= headers 200 %>
<%= json :resume_publication %>

## Create an publication

Create a new publication.

    POST /candidates/:candidate_id/resume/publications

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

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/publications/2894c358-f2d0-4a3f-952f-5afdb8dd81aa" %>
<%= json :resume_publication %>

## Update an publication

Update the provided publication.

    PATCH /candidates/:candidate_id/resume/publications/:publication_id

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
<%= json :resume_publication %>

## Delete an publication

Delete the provided publication.

    DELETE /candidates/:candidate_id/resume/publications/:publication_id

### Response

<%= headers 204 %>
