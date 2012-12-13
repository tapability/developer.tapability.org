---
title: Authentication/Keys | Tapability API
---

# Authentication/Keys API

* TOC
{:toc}

Keys can be created and deleted, but cannot be listed as a collection or updated. To
see a listing of account tokens, you must login to your account via the web at
tapability.org.

## Create a new key

This endpoint requires a separate `X-Tapability-Client-Token` header that is available
upon request. If you are a developer building an application for Tapability and need the
ability to generate access keys, please contact support.

To create a new key, you must send HTTP Basic Authentication in the authorization header
using the account email address and password. You cannot create a new token using an
existing token.

    POST /me/keys

### Parameters

_You must specify the account type_ so we know the type of account you're trying to authenticate.

account_type
: `candidate`, `counselor`, `employer`, default: `candidate`.

### Input

description
: _Optional_ **string**

<%= json \
    :description => "Dwight's iPhone"
%>

### Response

<%= headers 201 %>
<%= json(:key) %>

## Revoke a key's access

Revoke access to the specified key. This would typically be the current key that you
are using to authenticate, but you can revoke other keys as well.

    DELETE /me/keys/:token

### Response

<%= headers 204 %>
