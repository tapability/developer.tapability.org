---
title: Memberships | TAP API
---

# Memberships API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List memberships on a resume

Get a candidate's memberships listed on their resume

    GET /candidates/:candidate_id/resume/memberships

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_membership) { |h| [h] } %>

## Get a single membership

    GET /candidates/:candidate_id/resume/memberships/:membership_id

### Response

<%= headers 200 %>
<%= json :resume_membership %>

## Create an membership

Create a new membership.

    POST /candidates/:candidate_id/resume/memberships

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

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/memberships/2894c358-f2d0-4a3f-952f-5afdb8dd81aa" %>
<%= json :resume_membership %>

## Update an membership

Update the provided membership.

    PATCH /candidates/:candidate_id/resume/memberships/:membership_id

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
<%= json :resume_membership %>

## Delete an membership

Delete the provided membership.

    DELETE /candidates/:candidate_id/resume/memberships/:membership_id

### Response

<%= headers 204 %>
