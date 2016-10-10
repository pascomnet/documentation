---
url: /xmpp-api/module-archive/
prev: /xmpp-api/api-design/
next: /xmpp-api/module-base/
weight: 311
title: Module "archive"
keywords: 
  - Module "archive"
  - archives
description: All chat conversations are stored in the mobydick Database. You can easily find archived messages with archive.* commands.
toc: true
lang: en

---

## Abstract
Query the server based chat archive.
All chat conversations are stored in the mobydick Database. You can easily find archived messages with archive.* commands.

## Commands

### archive.FindDates
The use case is: you want to search for a certain term but you are only interested in the amount of conversations and the dates where the term was sent over the xmpp network.

You'll get a archive.Dates response.

#### Example

    <iq id="4Wefy-54" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="archive">
       <FindDates limit="100">
        <participant>mmeyer@mobydick</participant>
        <query>Project X</query>
      </FindDates>
    </cmd>
    </iq>

#### Usage
* you can limit the result set to N entries by setting the "limit" attribute. Defaults to 100 if omitted.
* the participant element is optional and can contain the bare JID of the 2nd user who participated in the conversations to be searched.
* the query element is mandatory and must contain at least 3 characters. 

### archive.FindEntries
Use archive.FindEntries to retrieve the real chat entries and not a list of dates.
You'll receive a archive.EntryList response.

#### Example

    <iq id="4Wefy-55" type="get">
     <cmd xmlns="http://www.pascom.net/mobydick" module="archive">
      <FindEntries limit="10">
        <fromdate>2013-10-01 01:00:00</fromdate>
        <todate>2013-12-01 01:00:00</todate>
        <participant/>
        <query>Project X</query>
      </FindEntries>
     </cmd>
    </iq>

#### Usage
* you can limit the result set to N entries by setting the "limit" attribute. Defaults to 100 if omitted.
* fromdate is mandatory and contains the first timestamp for your search. You can set it as "1970-01-01 01:00:00" should you want to search without a time boundary.
* todate is optional and can contain a second timestamp to set a time boundary for the query.
* the participant element is optional and can contain the bare JID of the 2nd user who participated in the conversations to be searched.
* the query element is mandatory and must contain at least 3 characters. 

## Responses

### archive.Dates
Contains a list of archive.date entries, which in turn contains exactly one archive.ArchiveEntry for the first occurence of the given search term within the searched date criteria.

#### Example:

    <iq id="4Wefy-54" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="archive">
      <Dates>
        <Date date="2013-10-21">
          <ArchiveEntry timestamp="2013-10-21 13:10:37" from="mmeyer@mobydick" to="tweber@mobydick" conversationid="1756">
            <body>We need to talk about Project X</body>
          </ArchiveEntry>
        </Date>
        <Date date="2013-10-23">
          <ArchiveEntry timestamp="2013-10-23 13:38:16" from="mmeyer@mobydick" to="tweber@mobydick" conversationid="2022">
            <body>Customer has a new idea about Project X</body>
          </ArchiveEntry>
        </Date>
        <Date date="2013-11-10">
          <ArchiveEntry timestamp="2013-11-10 08:55:09" from="tweber@mobydick" to="mmeyer@mobydick" conversationid="2065">
            <body>Did you implement the Project X changes?</body>
          </ArchiveEntry>
        </Date>
        <Date date="2013-11-12">
          <ArchiveEntry timestamp="2013-11-12 13:26:53" from="tweber@mobydick" to="mmeyer@mobydick" conversationid="2253">
            <body>Looks like we can finish Project X in Time!</body>
          </ArchiveEntry>
        </Date>
      </Dates>
    </cmd>
    </iq>

### archive.ArchiveEntryList

Contains a list of archive.ArchiveEntry elements which mention the given search term.

#### Example:

    <iq id="4Wefy-55" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="archive">
       <ArchiveEntryList>
          <ArchiveEntry timestamp="2013-10-21 13:10:37" from="mmeyer@mobydick" to="tweber@mobydick" conversationid="1756">
            <body>We need to talk about Project X</body>
          </ArchiveEntry>
          ..
          ..
          ..
        </ArchiveEntryList>
    </cmd>
    </iq>

## Events

This Module does not send any events.
