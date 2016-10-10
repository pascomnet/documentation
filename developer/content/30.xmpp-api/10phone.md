---
url: /xmpp-api/module-phone/
prev: /xmpp-api/module-monitor/
next: /xmpp-api/module-phonebook/
weight: 318
title: Module "phone"
keywords: 
  - Module "phone"
  - phone - remote control
  - access phones
description: Module "phone" - You can remotely control several features on supported phones without the having the burden of manufacturer/model low level access.
toc: true
lang: en

---

## Abstract
Control a supported phone device remotely.
You can remotely control several features on supported phones without the having the burden of manufacturer/model low level access.

## Commands
### phone.Hangup
Send a hangup/decline/cancel keypress to the given phone. Answered by a base.Success or base.Failure response.

#### Example
    <iq id="7Eefr-85" type="get">
     <cmd xmlns="http://www.pascom.net/mobydick" module="phone">
      <Hangup device="Snom 000413260a1b [Sales]"/>
     </cmd>
    </iq>

### phone.Hold
Send a hold keypress to the given phone. Answered by a base.Success or base.Failure response.
On most phones this can also unhold a call. You need to track the base.ChannelEvent state if you want to implement a hold/unhold logic.

#### Example
    <iq id="7Eefr-86" type="get">
     <cmd xmlns="http://www.pascom.net/mobydick" module="phone">
      <Hold device="Snom 000413260a1b [Sales]"/>
     </cmd>
    </iq>
    
### phone.Offhook

Send a offhook/accept keypress to the given phone. Answered by a base.Success or base.Failure response. Typically this is bound to some "accept incoming call" buttons in the client application and most useful if the user has a headset.

####Example
    <iq id="7Eefr-87" type="get">
     <cmd xmlns="http://www.pascom.net/mobydick" module="phone">
      <Offhook device="Snom 000413260a1b [Sales]"/>
     </cmd>
    </iq>

### phone.Transfer
Send a transfer keypress to the given phone. Answered by a base.Success or base.Failure response. This can trigger an attended transfer in case there is a held channel and an active one. You need to track the base.ChannelEvent state if you want to implement a smart behaviour.
#### Example
    <iq id="7Eefr-88" type="get">
     <cmd xmlns="http://www.pascom.net/mobydick" module="phone">
      <Transfer device="Snom 000413260a1b [Sales]"/>
     </cmd>
    </iq>
### phone.Conference
Send a conference keypress to the given phone. Answered by a base.Success or base.Failure response. This can trigger a 3-person-conference in case there is a held channel and a active one.  You need to track the base.ChannelEvent state if you want to implement a smart behaviour.

#### Example
    <iq id="7Eefr-89" type="get">
     <cmd xmlns="http://www.pascom.net/mobydick" module="phone">
      <Conference device="Snom 000413260a1b [Sales]"/>
     </cmd>
    </iq>

## Responses

This Module does not send any module specific responses.

## Events
This Module does not send any events.