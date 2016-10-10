---
url: /xmpp-api/module-mobile/
next: /xmpp-api/module-monitor/
prev: /xmpp-api/module-location/
weight: 316
title: Module "mobile"
keywords: 
  - Module "mobile"
  - mobydick mobile gateway
  - mobile app integration via xmpp
description: Module "mobile" - Use the mobydick mobile gateway for you own apps.
toc: true
lang: en

---

## Abstract
Use the mobydick mobile gateway for you own apps.

## Commands

### mobile.PrepareDial
Send a mobile.PrepareDial to the mobile hub gateway in order to predefine a internal or external target number which will be called when you call the gateway number.

The response is a mobile.ReadyToDial acknowledgement or a base.Failure.

#### Example

    <iq id="7Eefr-85" type="get">
     <cmd xmlns="http://www.pascom.net/mobydick" module="mobile">
      <PrepareDial device="Sales Cellphone" target="0895555555" prefix="auto"/>
     </cmd>
    </iq>

#### Usage
* device is mandatory and chooses the to-be-used phone. It must have the "fully integrated mobilephone" device type.
* all other attributes are similar to the base.Dial syntax
* this command does not place a call. The workflow is:
    1. send a mobile.PrepareDial command
    2. get back the responsible gateways number
    3. use GSM or another technology and dial the number of the gateway (could be a different device, must not be xmpp enabled!)
    4. you'll now be connected to the prepared target 

## Responses

### mobile.ReadyToDial
Send a mobile.PrepareDial to the mobile hub gateway in order to predefine a internal or external target number which will be called when you call the number of the gateway.

The response is a mobile.ReadyToDial acknowledgement or a base.Failure.

#### Example

    <iq id="7Eefr-85" type="result">
     <cmd xmlns="http://www.pascom.net/mobydick" module="mobile">
      <ReadyToDial gateway="089444444444"/>
     </cmd>
    </iq>

## Events
This Module does not send any events.