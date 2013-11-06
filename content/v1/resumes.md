---
title: Resumes | TAP API
---

# Resumes API

* TOC
{:toc}

Candidates can fetch their full resume using the shortcut `/me/resume` endpoint, but all updates
must go through the main candidate endpoints. When logged in as a candidate and editing the resume,
you are required to supply the candidate ID, it is not detected automatically.

Sub-resources of a resume can only be managed using their separate endpoints. For example, although
"education" information is included in the full resume payload, you can only make changes to these
items via the `/candidates/:id/resume/educations` endpoints.

## Get my resume

_This endpoint is only available to candidates_

Get the currently logged in candidate's resume

    GET /me/resume

### Response

<%= headers 200 %>
<%= json :resume_authenticated %>

## Edit a candidate's resume

_This endpoint is only available to candidates and counselors, candidates can only edit their own resume_

Update the contact information provided candidate's resume.

    PATCH /candidates/:candidate_id/resume

### Input

objective
: _Optional_ **string**


<%= json \
    :objective   => "Get a job in Scranton, PA"
%>

### Response

<%= headers 200 %>
<%= json :resume_full %>
