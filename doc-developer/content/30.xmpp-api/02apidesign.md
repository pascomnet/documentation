---
url: /xmpp-api/api-design/
prev: /xmpp-api/configuration/
next: /xmpp-api/module-archive/
weight: 302
title: API Design
keywords: 
  - API Design
description: In our mobydick developer documtation we explain the XMPP API Desin at its best. 
toc: true
lang: en

---


## Concept

### User

Enabled Users, and respective Queues are made available as a User automatically within the XMPP Server. 
The authentication is achieved therefore using the password of the user that is stored with the mobydick. 
Queues are automatically managed, and one cannot register themselves on the XMPP Server, rather one can interact with it.

### Telephone Presence

A core feature of the XMPP Protocols is that it allows multiple simultaneous connections from the same user. 
To this end, the user adresse (JabberID,  JID for short) will be supplemented with a so-called resource. 
All Desktop Clients as well as many Libraries can be automatically provided with the resource identifier. 

A JID consists of:

    username@domain/ressource


If the identity registration name is "olsen" and the XMPP Domain is "mobydick",  then the base JIC would be *olsen@mobydick* and the full JID of the Client could be *olsen@mobydick/c3kd82*.

We use this principal in order to automatically build an internal connection with the Ressource name "phone" 
(*olsen@mobydick/phone*) for every known user.
This internal connection reproduces in real time the direct status of the Asterisk Registration as well as the Telephone 
status on the XMPP Network and automatically distributes all changes on to authorised users (see below).

Through using this particular integration alone, every authorised person with a standard XMPP client can see the statues (free/busy) of other participants. 

## Command API

Every mobydick Command and Event (so-called XMPP Command API) are packed into a XML element of the type **cmd** and with the attribute **module**.  

### Commands as XMPP IQ Stanzas

XMPP provides a variety of message types or [Stanzas](http://xmpp.org/rfcs/rfc3920.html#stanzas "Commands as XMPP IQ Stanzas") in XMPP Jargon, with specific features. For our interface we chose the so-called Info/Query, IQ for short. 
The [RFC3920](http://xmpp.org/rfcs/rfc3920.html "More about RFC3920") explains in point 9.2.3 the underlying semantics.

In short, a IQ packet always ensures an answer in the form of either IQ Results or IQ Errors, somewhat similar to HTTP protocols.  In principle, the answers arrive asynchronously, but there is a timeout after which has elapsed an Error Packet will be sent.

A complete XMPP IQ Packet with a *Dial* Command will look somewhat like the following:

    <iq id="Uy13U-10" type="get">
      <cmd xmlns='http://www.pascom.net/mobydick' module='base'>
        <Dial target='mpasquay@entwicklung' />
      </cmd>
    </iq>


In this way, the individual XML Elements originate from the following layers:

* "iq" : is generated from the XMPP Stack from the User Library 
* "id": Unique Packet Identifier. Normally this is also generated from the user library, later incoming responses will have the same ID
* "cmd" : this is where the actual content begins.
* "Dial" : The command to be executed. 

As the IQ is directed to the server, there is no need to enter a "to" Address.

### Events as XMPP Messages

Events will not be sent from the server in IQ Format, rather as simple XMPP Messages. 
Your system, therefore does not have to answer an incoming event. This process is somewhat comparable to a UDP packet. 
The server sends it, but the client does not confirm its receipt. 

In the scenario of *ChannelEvents*, this could be displayed as follows:


    <message to="tweber@mobydick/a4f8d33" from="pbx.mobydick">
        <cmd xmlns="http://www.pascom.net/mobydick" module="base">
            <ChannelEvent>
                <eventType>busy</eventType>
                <eventId>SIP/abDlFfq8x2726ee-00000559</eventId>
                <eventDetails>mailbox</eventDetails>
                <outbound>true</outbound>
                <internal>true</internal>
                <sourceName>Thomas Weber</sourceName>
                <sourceNumber>1234</sourceNumber>
                <sourceCallerIdName>Thomas Weber</sourceCallerIdName>
                <targetName>Mailbox</targetName>
                <targetCallerIdName/>
                <targetNumber>*100</targetNumber>
                <busySince>1385735733276</busySince>
                <refChannel/>
                <device>Snom 0004132726ee [my snom]</device>
                <fromName/>
                <fromNumber/>
            </ChannelEvent>
        </cmd>
    </message>


### Modules

The Attribute **module** plays an important role, which with the above example has the value base. The Command API is in various function areas divided into the so-called modules. On both the side of the client as well as the server side, it is useful to use the notion of Modules for the grouping of functions.

As far as it is possible, one should try to match these designations with the Modules already existing in the Commander Web User Interface. The [REST API]({{< relref "20.rest api/index.md" >}}) also uses the Module division as a construct of the URI.

{{% notice note %}}
From here onwards, commands will always be denoted in the format MODULE.CMDNAME. The 2 commands above are therefore called *base.Dial* and *base.ChannelEvent* respectively
{{% /notice %}}

### Login Process

Immediately after the XMPP Login, the Command API expects a packet called *xmppuser.ClientInfo*. 

It contains Environment information as well as a list of the subscribed to events. As an answer to this command the XMPP
server then sends the xmppuser.UserInfo in reply. With the data contained therein then knows the complete state of the
mobydick Users, including the actual locations, available devices, Telephone and Fax Numbers etc.

{{% notice note %}}
For the exact Syntax of both Stanzas, please refer to the following Reference Sections.
{{% /notice %}}

## Event Subscriptions

It goes without saying that you want to be able to react to typical events, such as an incoming call.
As mobydick produces a large number of events, it is wise to consider a performance application, to help you with which 
events you will actually use. The flood of information can cause problems, in particular for xmpp.supervisor authorised 
accounts. In order to receive these events, you now have to subscribe to them.

### Static Subscription

Here you need to use the above named *xmppuser.ClientInfo* at login time to subscribe to events which you require 
for the complete running time of your Application. 

### Dynamic Subscription

Sometimes you will only need more data for a short period of time, because the user has opened their 
Application, e.g. a particular screen. In this case, simple expand the subscription dynamically via 
the *event.AddSubscription*. As soon as the user then closes the mask again, they will unsubscribe from the surplus
events through the *event.RemoveSubscription*.

### Subscription Filter

Depending on applications uses, you should now only be interested in very specific concrete events. 
In order to communicate your intentions the the system, you can use the so-called Subscription Filter. 
Using these filters allows you to map, for example to following scenarios: 

* specify a single event on a module
* all events on a module (Wildcard)
* as above but with additional comparisons of a particular attribute: e.g. only events in a particular queue or all queue events but only for a particular agent, etc.
* if xmpp.supervisor rights are provided: as above but extended to the so-called Scope. Only shows events for the authenticated user or for all users.

