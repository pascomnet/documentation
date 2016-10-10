---
url: /xmpp-api/module-redirect/
prev: /xmpp-api/module-queue/
next: /xmpp-api/module-xmppuser/
weight: 321
title: Module "redirect"
keywords: 
  - Module "redirect"
  - Manage server based call deflection
description: Module "redirect" - Manage server based call deflection.
toc: true
lang: en

---

## Abstract
Manage server based call deflection.


## Commands

### redirect.FindOwn
Just call redirect.FindOwn to retrieve the authenticated users' deflection state. This command is rarely used because the initial deflection state is embedded within the xmppuser.UserInfo packet and you can additionally subscribe to redirect.RedirectEntry for state changes.

#### Example

    <iq id="bWjfh-22" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="redirect">
        <FindOwn/>
      </cmd>
    </iq>

#### Usage
You can call redirect.FindOwn at any time and it will be answered by a redirect.RedirectEntry packet.

## Responses
### redirect.RedirectEntry

#### Example
    <iq id="bWjfy-18" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="redirect">
        <RedirectEntry>
        <source>340</source>
        <target>333</target>
        <old>333</old>
       </RedirectEntry>
     </cmd>
    </iq>
## Events

### journal.RedirectEntry
It's also possible to subscribe to the RedirectEntry in order to be notified whenever the deflection state changes.