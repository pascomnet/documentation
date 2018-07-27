---
url: /xmpp-api/module-base/
next: /xmpp-api/module-event/
prev: /xmpp-api/module-archive/
weight: 312
title: Module "base"
keywords: 
  - Module "base"
  - Place phone calls
  - transfer or pickup a call
description: mobydick Module "base" - Basic telephony features and generic commands. Place phone calls, transfer or pickup a call.
toc: true
lang: en

---

## Abstracts
 Basic telephony features and generic commands. Place phone calls, transfer or pickup a call.
 
## Commands

#base.Dial
Use this command if you would like to phone somebody. As a response, you will receive either of:  base.success or base.failure 

#### Example:

    <iq id="8Wefy-61" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="base">
       <Dial target='08955555555' prefix='auto'/>
      </cmd>
    </iq>

#### Usage
* prefix can be either a number or the special value 'auto'. Auto will figure out if you need any additional prefixes/zero's to reach the given target. 
* instead of target and prefix you can also use the attribute viasetting. 
* It can contain the full path of a mobydick system setting and functions as an indirection: i.e. it will dial the number which is stored in this setting.example: viasetting="sys.asterisk.dialplan.global.voicebox.own.value" will dial "*100" to reach the personal voicemail box of the authenticated user.
* optionally you can add a device attribute to explicitly use a specific phone if the user has more then one assigned.
Otherwise the first available phone with the "dial" capability will place the call. 

### base.DialFrom
A xmpp.supervisor user can place a phone call on behalf of another user.  As a response, they will receive either of:  base.success or base.failure 

#### Example:

    <iq id="8Wefy-62" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="base">
       <DialFrom identity='mmeyer' target='08955555555' prefix='auto'/>
      </cmd>
    </iq>

#### Usage
* identity is mandatory and must contain a valid mobydick username
* see base.Dial for further details.

### base.Hangup
Each user has the permission to end their phone calls. A supervisor can additionally hangup arbitrary channels from within the total system.  As a response, they will receive either of:  base.success or base.failure.

#### Example

    <iq id="8Wefy-63" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="base">
       <Hangup channel='SIP/xlite1-00000004'/>
      </cmd>
    </iq>

#### Usage
* the channel id is optional for non-supervisor users. You'll hangup the most recent call if this attribute is omitted.
* If you have multiple concurrent calls (one is put on hold for example): use the channel id from a previously received base.ChannelEvent

### base.Transfer
Each user has the permission to transfer an active phone call to another target. A supervisor can additionally transfer arbitrary channels in the whole system.  As a response, they will receive either of:  base.success or base.failure.

#### Example

    <iq id="8Wefy-64" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="base">
       <Transfer channel="SIP/xlite1-00000118" target="320" prefix="auto"/>
      </cmd>
    </iq>

#### Usage
* the channel id is mandatory, use the channel id from a previously received base.ChannelEvent
* target and prefix are similar to a base.Dial command

### base.Pickup
If your user receives a notification about a pickup possibility, they can send this command to fetch the ringing channel from another user. As a response, they will receive either of: base.success or base.failure.

#### Example

    <iq id="8Wefy-65" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="base">
       <Pickup target='320' device='SIP xlite1 [Development]'/>
      </cmd>
    </iq>

#### Usage
* target is mandatory and contains the internal phone number of the user you want to pick a call from
* device is optional and can contain the device which will perform the pickup, see base.Dial for more details

## Responses

### base.Success
If there is no command specific response available, you'll receive a friendly base.Success with some optional text. It's the Command API equivalent to a HTTP "200 OK".

#### Example

    <iq id="8Wefy-65" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="base">
        <Success>
          <message>Ok</message>
        </Success>
      </cmd>
    </iq>

### base.Failure
Whenever something goes wrong on the application layer you will get this response. 

#### Example

    <iq id="8Wefy-64" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="base">
        <Failure>
          <message>Transfer not successfull</message>
        </Failure>
      </cmd>
    </iq>

## Events
### base.ChannelEvent
Each change in the state of one of your phone calls triggers a base.ChannelEvent. It's one of the most fundamental events in the mobydick system.

A normal user only gets the base.ChannelEvents which directly affect the authenticated user. A supervisor can, however, subscribe to all ChannelEvent's but still limit the amount with filters.

#### Example

    <message to="tweber@mobydick/mdfxclient_tw-macbook.swe.local" from="pbx.mobydick">
     <cmd xmlns="http://www.pascom.net/mobydick" module="base">
      <ChannelEvent>
        <eventType>ringing</eventType>
        <eventId>SIP/xlite1-0000011c</eventId>
        <eventDetails/>
        <outbound>false</outbound>
        <internal>true</internal>
        <sourceName>Thomas Mattausch</sourceName>
        <sourceNumber>370</sourceNumber>
        <sourceCallerIdName/>
        <targetName>Thomas Weber</targetName>
        <targetCallerIdName/>
        <targetNumber>340</targetNumber>
        <busySince>0</busySince>
        <refChannel/>
        <device>SIP xlite1 [Entwicklung1]</device>
        <fromName/>
        <fromNumber/>
        <LabelList>
              <Label >
                    <id>MDC_LABEL-1</id>
                    <displayName>VIP</displayName>
                    <type>generic</type>
                    <value>1</value>
                    <visible>true</visible>
              </Label>
         </LabelList>
      </ChannelEvent>
    </cmd>
    </message>

Some notes:

* eventType: the state of the given call: 
    * ringing = a new caller is knocking on your users' door,  or rather their earpiece or phone
    * busy = the user is phoning with the calling party
    * hold = the user holds this call
    * unhold = hold flag has been removed
    * transfer = this call is being transferred to somebody else
    * rename = the callerid changed for some reason. Can be a new name or a new number.
    * redirect = the call is redirected to somebody else
    * hangup = the call ends
* eventId: tells you about the id of the asterisk channel which triggered this xmpp event. Use it in subsequent calls like base.transfer
* device: holds the name of the phone device which was/is affected by this event. You can use this information in subsequent calls to various base.* or phone.* commands.

### base.PickupEvent
Subscribe to base.PickupEvent if your authenticated user is eligible to pickup a call from another user and your application can display a hint in this situation.

#### Example

    <message to="tweber@mobydick/mdfxclient_tw-macbook.swe.local" from="pbx.mobydick">
     <cmd xmlns="http://www.pascom.net/mobydick" module="base">
       <PickupEvent>
        <eventType>ringing</eventType>
        <eventId>tmattausch</eventId>
        <target>370</target>
        <sourceName>Mathias Pasquay</sourceName>
        <sourceNumber>320</sourceNumber>
      </PickupEvent>
    </cmd>
    </message>

Some notes:

* eventType: the state of the pickup possibility: 
    * ringing = you can pickup from now on
    * gone = you can not pickup the call anymore, someone else took the call or caller hung up themselves
* eventId/target: contains the username and the internal phone number of your fellow pickup group member. Remember the eventId in case you want to send a base.Pickup command.
* sourceName/sourceNumber: tells you about the person who is calling the target
