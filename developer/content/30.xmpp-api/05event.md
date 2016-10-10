---
url: /xmpp-api/module-event/
next: /xmpp-api/module-journal/
prev: /xmpp-api/module-base/
weight: 313
title: Module "event"
keywords: 
  - Module "event"
  - Command-API Event Subscriptions
description: Does your application need realtime data from the telephony system? Just add some subscriptions and the xmppserver keeps your data model up to date.
toc: true
lang: en

---

## Abstract
Manage Command-API Event Subscriptions.
Does your application need realtime data from the telephony system? Just add some subscriptions and the xmppserver keeps your data model up to date.

## Commands

### event.AddSubscription
Subscribe to more events. Each AddSubscription command contains one or more Subscription sub elements. The Subscription itself has a flexible syntax to express various filters.

#### Complex Example:

    <iq id="bWxfy-4" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="event">
        <AddSubscription>
          <Subscription module="base" type="*" scope="user"/>
          <Subscription module="journal" type="*"/>
          <Subscription module="base" type="ChannelEvent" scope="supervisor"/>
          <Subscription module="queue" type="*">
            <AttributeFilter name="queue" equals="Support"/>
          </Subscription>
        </AddSubscription>
      </cmd>
    </iq>

Here we add 4 Subscriptions:
1. all events from the module "base" which affect the authenticated user.
2. all events from the module "journal" which affect the authenticated user. The attribute scope="user" can be omitted as it is the default value. 
3. all base.ChannelEvent events for all users. You will only get the events if the authenticated user has been assigned the xmpp.supervisor role type.
4. all events for the queue "Support" but only if the authenticated user is a member of this team or has been assigned the xmpp.supervisor role type.

#### Usage
You can call event.AddSubscription independently at any time or you can embed it in the xmppuser.ClientInfo command. Its possible to send multiple AddSubscription commands for the same command or to have overlapping filters. The system will still ensure that you'll receive each event only once.

Expect a response type of either event.SubscriptionList or base.Failure

### event.RemoveSubscription
Imagine you are writing a queue monitor to visualise the current load of one team (and only 1 Team). To limit your applications load, you would of course only subscribe to the queue's events for the period of time that your application is actually open. If the user opens the queue monitor window you would send out a event.AddSubscription and if the window is then later closed you would in turn call the event.RemoveSubscription.

#### Example

    <iq id="bWxfy-9" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="event">
        <RemoveSubscription>
          <Subscription module="queue" type="*">
            <AttributeFilter name="queue" equals="Support"/>
          </Subscription>
        </RemoveSubscription>
      </cmd>
    </iq>

### Usage
event.RemoveSubscription can be called at any time and yields either a event.SubscriptionList or base.Failure response. 

## Responses

### event.SubscriptionList

Whenever you change the subscriptions of your xmpp session you'll get a event.SubscriptionList as a response. It's also embedded in the initial ClientInfo/UserInfo handshake.
It contains the effective list of subscriptions at any given time and follows the AddSubscription/RemoveSubscription syntax.

#### Example

    <iq id="bWxfy-4" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="event">
        <SubscriptionList>
          <Subscription module="base" type="*" scope="user"/>
          <Subscription module="journal" type="*" scope="user"/>
          <Subscription module="base" type="ChannelEvent" scope="supervisor"/>
          <Subscription module="queue" type="*" scope="user">
            <AttributeFilter name="queue" equals="Support"/>
          </Subscription>
        </SubscriptionList>
      </cmd>
    </iq>

## Events
This Module does not send any events.