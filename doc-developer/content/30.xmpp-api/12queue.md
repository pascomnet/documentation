---
url: /xmpp-api/module-queue/
prev: /xmpp-api/module-phonebook/
next: /xmpp-api/module-redirect/
weight: 320
title: Module "queue"
keywords: 
  - Module "queue"
  - Access queue status
  - agent statuses
description: Module "queue" - Access queue states and manage your agent statuses.
toc: true
lang: en

---

## Abstract
Access queue states and manage your agent statuses.

## Commands

### queue.FindOwnState
Send a queue.FindOwnState to request the state of all the queues of which the authorised user is a member.

#### Example
    <iq id="kJHfh-39" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
        <FindOwnState/>
      </cmd>
    </iq>

#### Usage
You can call queue.FindOwnState at any time and you'll get a queue.QueueMemberStates as a response. The response contains only the queue.QueueMemberState entries for the given agent, additional state information from other agents or waiting calls will be included.
The initial state is also included in the xmppuser.ClientInfo/xmppuser.UserInfo handshake.

### queue.FindQueueState
Query the full state of one queue.

    <iq id="bWHfh-36" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
        <FindQueueState name="Support"/>
      </cmd>
    </iq>
    
#### Usage
You can call queue.FindQueue at any time and you'll get a full queue.QueueState Response. Only users with xmpp.supervisor permission can access all the queues, otherwise you can only get the state of the queues of which the authenticated user is a member.

### queue.AgentLogin
Use this to log a dynamic agent into a queue. 

    <iq id="bWHfh-37" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
        <AgentLogin queue="Support" penalty=""/>
      </cmd>
    </iq>

#### Usage
You can call queue.AgentLogin if the authenticated user is a dynamic agent in the given queue and if they are not already logged in. The response is either a base.Success or base.Failure packet.
The penalty value is optional and can be omitted.

### queue.AgentLogout
Use this command to sign out from a queue. 

    <iq id="bWHfh-38" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
        <AgentLogout queue="Support"/>
      </cmd>
    </iq>

#### Usage
You can call queue.AgentLogout if the authenticated user is a dynamic agent in the given queue and if they are currently logged in. The response is either a base.Success or base.Failure packet.

### queue.AgentPause
Set the agents state to pause.

    <iq id="bWHfh-39" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
        <AgentPause queue="Support" reason="postprocessing"/>
      </cmd>
    </iq>

#### Usage
You can call queue.AgentPause if the authenticated user is either a static queue member or if they are currently logged in to the given queue. The response is either a base.Success or base.Failure packet.
The reason value is an arbitrary string which will end up in the queuelog, it can also be empty.

### queue.AgentUnpause
Removes the agents pause state.

    <iq id="bWHfh-39" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
        <AgentUnpause queue="Support" reason="postprocessing"/>
      </cmd>
    </iq>

#### Usage
You can call queue.AgentUnpause if the authenticated user is currently paused in the given queue. The response is either a base.Success or base.Failure packet.
The reason value is an arbitrary string which will end up in the queuelog, it can also be empty.

## Responses

### queue.QueueMemberStates
Is a list of membership states. Each queue.QueueMemberState element contains information about the state of one agent in one queue.

#### Example

    <iq id="kJHfh-39" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
      <QueueMemberStates eventType="" eventId="">
          <QueueMemberState agent="tweber" queue="Support" dynamic="true" loggedin="false" paused="false" eventType="" eventId="" pauseReason="">
            <PhonebookEntry eventId="" eventType="">
              <type></type>
              <id/>
              <firstname/>
              <surname/>
              <phone>340</phone>
              <fax/>
              <mobile/>
              <homephone/>
              <email/>
              <displayname>Thomas Weber</displayname>
              <organisation/>
            </PhonebookEntry>
          </QueueMemberState>
          ...
          ...
        </QueueMemberStates>
      </cmd>
    </iq>
    
### queue.QueueStates
Contains the complete state of one queue.

The overall structure is as follows:

* QueueState (id and name of the queue)
    * QueueCallEntryList
        * QueueCallEntry (First waiting call)
        * QueueCallEntry (Second waiting call)
        * ...
    * QueueMemberStates
        * QueueMemberState (State of agent 1)
        * QueueMemberState (State of agent 2)
        * ...
    * ueuePauseReasonList
        * QueuePauseReason
        
#### Example
    <iq id="kJHfh-36" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
       <QueueState jid="q_1" name="support">
        <QueueCallEntryList>
          <QueueCallEntry>
            <position>1</position>
            <channel>SIP/xlite3-0000010d</channel>
            <uniqueId>1386314874.1225</uniqueId>
            <PhonebookEntry eventId="" eventType="">
              <type>undef</type>
              <id/>
              <firstname/>
              <surname/>
              <phone>370</phone>
              <fax/>
              <mobile/>
              <homephone/>
              <email/>
              <displayname>Thomas Mattausch</displayname>
              <organisation/>
            </PhonebookEntry>
          </QueueCallEntry>
        </QueueCallEntryList>
        <QueueMemberStates eventType="" eventId="">
          <QueueMemberState agent="tweber" queue="support" dynamic="true" loggedin="false" paused="false" eventType="" eventId="" pauseReason="">
            <PhonebookEntry eventId="" eventType="">
              <type>undef</type>
              <id/>
              <firstname/>
              <surname/>
              <phone>340</phone>
              <fax/>
              <mobile/>
              <homephone/>
              <email/>
              <displayname>Thomas Weber</displayname>
              <organisation/>
            </PhonebookEntry>
          </QueueMemberState>
          <QueueMemberState agent="mmeyer" queue="support" dynamic="true" loggedin="false" paused="false" eventType="" eventId="" pauseReason="">
            <PhonebookEntry eventId="" eventType="">
              <type>undef</type>
              <id/>
              <firstname/>
              <surname/>
              <phone>360</phone>
              <fax/>
              <mobile/>
              <homephone/>
              <email/>
              <displayname>Markus Meyer</displayname>
              <organisation/>
            </PhonebookEntry>
          </QueueMemberState>
          <QueueMemberState agent="mpasquay" queue="support" dynamic="false" loggedin="true" paused="false" eventType="" eventId="" pauseReason="">
            <PhonebookEntry eventId="" eventType="">
              <type>undef</type>
              <id/>
              <firstname/>
              <surname/>
              <phone>320</phone>
              <fax/>
              <mobile/>
              <homephone/>
              <email/>
              <displayname>Mathias Pasquay</displayname>
              <organisation/>
            </PhonebookEntry>
          </QueueMemberState>
        </QueueMemberStates>
        <QueuePauseReasonList>
          <QueuePauseReason code="10">
            <reason>Backoffice</reason>
          </QueuePauseReason>
          <QueuePauseReason code="20">
            <reason>Lunch</reason>
          </QueuePauseReason>
        </QueuePauseReasonList>
      </QueueState>
      </cmd>
    </iq>
    
#### Notes
The QueueState can contain a list of "QueuePauseReason" Elements. It contains the pause reasons obtained from the web-ui including the dial code and the reason text. You can use it to present a "pause chooser" in your application.

{{% notice warning %}}
If this list is empty, then the Pausing feature will be universally disabled!
{{% /notice %}}


## Events
Depending on the permissions of the authenticated user you will notified and have access to more or less data/information.
Normal users:
* state changes for all agents of every queue of which the user is a member. 
* calls waiting within all of the queues of which the user is a member. 

User has *xmpp.supervisor* permission:
* state changes for every agent in every queue.
* calls waiting with every queue  
Of course you can limit the amount of data by using a subscription filter.

### queue.QueueMemberState
The Event is fired:

* if pause state changes
* if login state changes

For free/busy information you can just use the universal presence information, you'll not receive any additional events. 

#### Example

    <message to="tweber@mobydick/mdfxclient_tw-macbook.swe.local" from="pbx.mobydick">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
      <QueueMemberState agent="tweber" queue="support" dynamic="true" loggedin="true" paused="false" eventType="" eventId="" pauseReason="">
        <PhonebookEntry eventId="" eventType="">
          <type>undef</type>
          <id/>
          <firstname/>
          <surname/>
          <phone>340</phone>
          <fax/>
          <mobile/>
          <homephone/>
          <email/>
          <displayname>Thomas Weber</displayname>
          <organisation/>
        </PhonebookEntry>
      </QueueMemberState>
    </cmd>
    </message>

### queue.QueueJoinEvent
This event informs your application about a new call waiting within one queue. 

#### Example

    <message to="tweber@mobydick/mdfxclient_tw-macbook.swe.local" from="pbx.mobydick">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
      <QueueJoinEvent jid="q_1" name="support">
        <QueueCallEntry>
          <position>1</position>
          <channel>SIP/xlite3-00000116</channel>
          <uniqueId>1386315777.1234</uniqueId>
          <PhonebookEntry eventId="" eventType="">
            <type>undef</type>
            <id/>
            <firstname/>
            <surname/>
            <phone>370</phone>
            <fax/>
            <mobile/>
            <homephone/>
            <email/>
            <displayname>Thomas Mattausch</displayname>
            <organisation/>
          </PhonebookEntry>
        </QueueCallEntry>
      </QueueJoinEvent>
    </cmd>
    </message>

### queue.QueueLeaveEvent
Whenever a call which has been waiting reaches an agent you'll get a queue.QueueLeaveEvent.
It is also sent if the caller hangs up themselves.

#### Example

    <message to="tweber@mobydick/mdfxclient_tw-macbook.swe.local" from="pbx.mobydick">
      <cmd xmlns="http://www.pascom.net/mobydick" module="queue">
      <QueueLeaveEvent jid="q_1" name="support">
        <QueueCallEntry>
          <position>1</position>
          <channel>SIP/xlite3-00000116</channel>
          <uniqueId>1386315777.1234</uniqueId>
          <PhonebookEntry eventId="" eventType="">
            <type>undef</type>
            <id/>
            <firstname/>
            <surname/>
            <phone>370</phone>
            <fax/>
            <mobile/>
            <homephone/>
            <email/>
            <displayname>Thomas Mattausch</displayname>
            <organisation/>
          </PhonebookEntry>
        </QueueCallEntry>
      </QueueLeaveEvent>
    </cmd>
    </message>