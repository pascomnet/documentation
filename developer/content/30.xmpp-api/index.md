---
url: /xmpp-api/
prev: /rest-api/
next: /xmpp-api/configuration/
weight: 30
title: XMPP API
keywords:
  - mobydick XMPP API
  - integration of mobydick into applications
  - Extensible Messaging and Presence Protocol
  - documentation
description: mobydick XMPP API can be accessed through the integrated XMPP server on a protocol level and is especially suitable for longer running applications
toc: true
lang: en
icon: <i class="fa fa-comments-o" aria-hidden="true"></i>
---

## Abstract

mobydick can be accessed through the integrated XMPP server on a protocol level.

The XMPP API is especially suitable for longer running applications, as any number of notifications concerning System Events and Modifications can be pushed over a single one time established connection.
Therefore, commands and events can be exchanged via either a individual function account (System to System) or over multiple simultaneous connections (user to user).


## Overview

The services provided by XMPP can be used across a variety of freely available [Clients](http://xmpp.org/software/clients.html "XMPP Clients") and a set of [Libraries](http://xmpp.org/software/libraries.html "XMPP Libraries") for all major programming languages:

 * Chat service and presence display for all subscribed colleagues and teams
 * Central Server Side Chat Archive
 * internal File transfer
 * Presence Display of the telephone of the Identity (not logged on/free/incall)
 * Real Time Events for Telephony Integration (Call incoming/outgoing etc.)
 * well defined and open API for your individual integrations projects.

{{% notice tip %}}
The mobydick Desktop and mobile Clients, as well as the TAPI Service Provider, explicitly uses the XMPP protocol.
All pre existing features can therefore also be used, with help from the XMPP Interface, for individual projects. To a certain extent, you can view the Client as a reference implementation of the XMPP API.
{{% /notice %}}
