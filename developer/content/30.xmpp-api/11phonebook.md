---
url: /xmpp-api/module-phonebook/
prev: /xmpp-api/module-phone/
next: /xmpp-api/module-queue/
weight: 319
title: Module "phonebook"
keywords: 
  - Module "phonebook"
  - Access the mobydick phonebook
description: Module "phonebook" - Access the mobydick phonebook.
toc: true
lang: en

---

## Abstract
Access the mobydick phonebook

## Commands

### phonebook.FindAll
If you really need it:  phonebook.FindAll fetches the full mobydick phonebook. 

#### Example
    <iq id="bWHfh-34" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="phonebook">
        <FindAll/>
      </cmd>
    </iq>

#### Usage
You can call phonebook.FindAll at any time and it will be answered by a phonebook.PhonebookList packet.

###phonebook.Find
Query all phonebook entries for a given substring. It will perform a substring match in all fields.

#### Example
    <iq id="bWHfh-35" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="phonebook">
        <Find query="meyer"/>
      </cmd>
    </iq>

#### Usage
You can call phonebook.Find at any time and it will be answered by a phonebook.PhonebookList packet.

## Responses
phonebook.PhonebookList
#### Example
    <iq id="bWHfh-35" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="phonebook">
      <PhonebookList>
        <PhonebookEntry eventId="" eventType="">
          <type>011account</type>
          <id>Markus Meyer</id>
          <firstname>Markus</firstname>
          <surname>Meyer</surname>
          <phone>555</phone>
          <fax/>
          <mobile/>
          <homephone/>
          <email>markus.meyer@mobydick.local</email>
          <displayname>Markus Meyer</displayname>
          <organisation/>
          <LabelList>
              <Label >
                    <id>MDC_LABEL-1</id>
                    <displayName>VIP</displayName>
                    <type>generic</type>
                    <value>1</value>
                    <visible>true</visible>
              </Label>
           </LabelList>
        </PhonebookEntry>
        ...
        ...
       </PhonebookList>
      </cmd>
    </iq>

## Events
This Module does not send any events.