---
url: /rest-api/
prev: /introduction/
next: /xmpp-api/
weight: 200
title: REST API
keywords:
  - mobydick REST Interface
  - integration of mobydick into 3rd Party Provider
  - Representational State Transfer
  - documentation
description: Using the mobydick REST Interface for the integration of mobydick into 3rd Party Provider hardware and software
toc: true
lang: en
icon: <i class="fa fa-globe" aria-hidden="true"></i>
---

## Overview

### What is REST?
For a subjective definition of the term "Representational State Transfer" please refer to the [Wikipedia REST Article](https://en.wikipedia.org/wiki/Representational_state_transfer "Representational State Transfer").

The main features of a REST Interface include:

* Providing access to readable/writable structured data via HTTP
* each resource in the system, e.g. a User of the Telephone system, has their own URI
* The Protocol is Stateless an has no sessions
* It is lightweight
* There are no formal Interface descriptions, unlike with SOAP Web Services for example
* In the simplest scenario, you can use data interrogation tools such as wget, curl or simply direct from your browser
* HTTP Header and Return Codes are used extensively. Requests to non-existing data objects will be answered with, for example a HTTP 404 Return code.

### What I can do with the it?
You can, for example, trigger calls for a particular user via REST- Request or call up related call data. mobydick provides you with a multitude of options which are available.

### How is the data formatted?
All URI's return all your content in the form of [JSON Data](https://en.wikipedia.org/wiki/JSON " JavaScript Object Notation"). This has the advantage that the data is very easy to parse and process in all common programming languages. Compared to XML, JSON is somewhat more compact.

Below is an extract from the Return Information from the request for data relating to the user tmattausch:

    http://IP_OF_MOBYDICK/services/identity/tmattausch

Looks somewhat similar to:

    ...
    "014use_calleridnum": "",
    "014use_exttimeout": "30",
    "014use_extrcd": "nein",
    "014use_extrcdallow": "ja",
    "014use_intercom": "nein",
    "014use_inttimeout": "25",
    "014use_intrcd": "nein",
    "014use_intrcdallow": "ja",
    "014use_name": "tmattausch",
    ...

## Configuration

### Setting up a User
In order to be able to access the REST-API, you have create a use for this purpose.  To do this, log in via SSH to the mobydick (see Access to mobydick) and become the root.

Now setup the desired user with the following command:

    htpasswd -b /etc/apache2/users.ht YOUR_USER YOUR_PASSWORD

### Initial Access

Call up the URL `http://IP_OF_MOBYDICK/services`  

![Screenshot - mobydick REST API](/rest_api_doc.png "mobydick REST API")

mobydick will then display the REST-API Documentation. Here you will be able to see all the available REST prompts and test them before you install the URL prompts into an application.
