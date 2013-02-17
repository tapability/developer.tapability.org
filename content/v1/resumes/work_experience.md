---
title: Work Experiences | Tapability API
---

# Work Experiences API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List work experiences on a resume

Get a candidate's work experiences listed on their resume

    GET /candidates/:candidate_id/resume/work_experiences

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_work_experience) { |h| [h] } %>

## Get a single work experience

    GET /candidates/:candidate_id/resume/work_experiences/:work_experience_id

### Response

<%= headers 200 %>
<%= json :resume_work_experience %>

## Create an work experience

Create a new work experience.

    POST /candidates/:candidate_id/resume/work_experiences

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

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/work_experiences/2894c358-f2d0-4a3f-952f-5afdb8dd81aa" %>
<%= json :resume_work_experience %>

## Update an work experience

Update the provided work experience.

    PATCH /candidates/:candidate_id/resume/work_experiences/:work_experience_id

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
<%= json :resume_work_experience %>

## Delete an work experience

Delete the provided work experience.

    DELETE /candidates/:candidate_id/resume/work_experiences/:work_experience_id

### Response

<%= headers 204 %>
