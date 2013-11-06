---
title: Categories | TAP API
---

# Categories API

* TOC
{:toc}

_These endpoints are only available to counselors and candidates, candidates can only view/edit items in their own resume_

When adding a new category, you must supply the name of a valid category, such as "Sales". For an up-to-date listing on valid category names, see the root [Categories API](/v1/categories/) endpoint.

## List categories on a resume

Get a candidate's preferred job categories

    GET /candidates/:candidate_id/resume/categories

### Response

<%= headers 200, :pagination => true %>
<%= json(:resume_category) { |h| [h] } %>

## Create an category

Add a new category.

    POST /candidates/:candidate_id/resume/categories

### Input

name
: _Required_ **string**

<%= json \
    :name => "Sales"
%>

### Response

<%= headers 201, :Location => "https://tapability.org/api/v1/candidates/eaf3022f-330e-46db-8665-01e0969ff2f7/resume/categories/5f7ba741-e6e0-403e-9247-00e6138c313b" %>
<%= json :resume_category %>

## Delete an category

Delete the provided category.

    DELETE /candidates/:candidate_id/resume/categories/:category_id

### Response

<%= headers 204 %>
