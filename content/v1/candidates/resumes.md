---
title: Resumes | Tapability API
---

# Resumes API

* TOC
{:toc}

## Get my resume

_This endpoint is only available to candidates_

Get the currently logged in candidate's resume

    GET /me/resume

### Response

<%= headers 200 %>
<%= json :resume_authenticated %>

## Edit my resume

_This endpoint is only available to candidates_

Update the currently logged in candidate's resume

    PATCH /me/resume

### Input

objective
: _Required_ **string**

<%= json \
    :objective   => "Get a job in Scranton, PA"
%>

### Response

<%= headers 200 %>
<%= json :resume_authenticated %>
