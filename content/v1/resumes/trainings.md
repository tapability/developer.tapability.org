---
title: Trainings | Tapability API
---

# Trainings API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List trainings on a resume

Get a candidate's trainings listed on their resume

    GET /candidates/:candidate_id/resume/trainings

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_training) { |h| [h] } %>

## Get a single training

    GET /candidates/:candidate_id/resume/trainings/:training_id

### Response

<%= headers 200 %>
<%= json :resume_training %>

## Create an training

Create a new training.

    POST /candidates/:candidate_id/resume/trainings

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

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/trainings/2894c358-f2d0-4a3f-952f-5afdb8dd81aa" %>
<%= json :resume_training %>

## Update an training

Update the provided training.

    PATCH /candidates/:candidate_id/resume/trainings/:training_id

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
<%= json :resume_training %>

## Delete an training

Delete the provided training.

    DELETE /candidates/:candidate_id/resume/trainings/:training_id

### Response

<%= headers 204 %>
