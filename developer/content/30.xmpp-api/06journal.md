---
url: /xmpp-api/module-journal/
next: /xmpp-api/module-location/
prev: /xmpp-api/module-event/
weight: 314
title: Module "journal"
keywords: 
  -  Module "journal"
  - recent phone call data
description: Module "journal" - Get data about recent phone calls.
toc: true
lang: en

---

## Abstract
Get data about recent phone calls.
You can ask the xmppserver for a list of recent phone calls or you can subscribe to the journal.JournalEvent to get changes automatically.

## Commands
### journal.FindOwn
Just call *journal.FindOwn* to retrieve the authenticated users' list of recent phone calls. 

#### Example

  <iq id="bWjfy-18" type="get">
    <cmd xmlns="http://www.pascom.net/mobydick" module="journal">
      <FindOwn limit="30"/>
    </cmd>
  </iq>

#### Usage
You can call journal.FindOwn at any time and it will be answered by a journal.JournalList packet.
The limit Attribute is optional and will default to the value 100 if omitted.

### journal.FindByIdentity
If your application is authenticated with xmpp.supervisor permissions you can additionally request the journal for every other user:

  <iq id="bWjfy-19" type="get">
    <cmd xmlns="http://www.pascom.net/mobydick" module="journal">
      <FindByIdentity identity='jdoe' limit="30"/>
    </cmd>
  </iq>

In the above scenario, you will be provided with the journal from user "jdoe".

## Responses

### journal.JournalList

#### Example

    <iq id="bWjfy-18" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="journal">
      <JournalList>
        <JournalEntry eventId="771" eventType="create" userId="6" userName="tweber">
          <id>771</id>
          <timestamp>1386080714363</timestamp>
          <inbound>true</inbound>
          <internal>true</internal>
          <duration>0</duration>
          <connected>0</connected>
          <deviceId>0</deviceId>
          <deviceName/>
          <locationId>0</locationId>
          <locationName/>
          <name>Thomas Mattausch</name>
          <number>370</number>
          <prefix/>
          <result>redirect</result>
          <resultDetails>from</resultDetails>
          <via/>
          <viaDetails/>
          <extension>340</extension>
          <recordId>1386080714363-21_1386080714363-28</recordId>
        </JournalEntry>
        ...
        ...
     </JournalList>
    </iq>

#### Notes
* recordId: will not be empty if at least one recording was triggered in this call. See Module "monitor" for Details.

## Events

### journal.JournalEntry
If you subscribe to the journal.JournalEntry event, you'll be notified whenever the user finishes a phone call.