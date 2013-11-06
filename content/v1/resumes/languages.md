---
title: Languages | TAP API
---

# Languages API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

## List languages on a resume

Get a candidate's languages listed on their resume

    GET /candidates/:candidate_id/resume/languages

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_language) { |h| [h] } %>

## Get a single language

    GET /candidates/:candidate_id/resume/languages/:language_id

### Response

<%= headers 200 %>
<%= json :resume_language %>

## Create an language

Create a new language.

    POST /candidates/:candidate_id/resume/languages

### Input

name
: _Required_ **string**

fluency
: _Required_ **string**

read
: _Optional_ **boolean**

write
: _Optional_ **boolean**

speak
: _Optional_ **boolean**

<%= json \
    :name    => "Spanish",
    :fluency => "Conversational",
    :read    => true
%>

### Response

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/languages/f8c78d5c-f206-41bc-aca3-bd1b4882b4df" %>
<%= json :resume_language %>

## Update an language

Update the provided language.

    PATCH /candidates/:candidate_id/resume/languages/:language_id

### Input

name
: _Required_ **string**

fluency
: _Required_ **string**

read
: _Optional_ **boolean**

write
: _Optional_ **boolean**

speak
: _Optional_ **boolean**

<%= json \
    :name    => "Spanish",
    :fluency => "Conversational",
    :read    => true
%>

### Response

<%= headers 200 %>
<%= json :resume_language %>

## Delete an language

Delete the provided language.

    DELETE /candidates/:candidate_id/resume/languages/:language_id

### Response

<%= headers 204 %>
