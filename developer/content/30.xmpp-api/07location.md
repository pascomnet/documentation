---
url: /xmpp-api/module-location/
next: /xmpp-api/module-mobile/
prev: /xmpp-api/module-journal/
weight: 315
title: Module "location"
keywords: 
  - Module "location"
  - Roaming
  - Hot desking via XMPP Command
description: Module "location" - Switch to another location. Roaming. Hot desking.
toc: true
lang: en

---

## Abstract
Switch to another location. Roaming. Hot desking.

## Commands

### location.Find

Asks mobydick for possible locations of the authenticated user. You'll receive a location.LocationList as response.

#### Example:

    <iq id="9JeHy-73" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="location">
       <Find/>
      </cmd>
    </iq>

### location.RelocateUser
Switch from one location to another. The direct response is a base.Success accompanied by a either location.SetLocation event or base.Failure.  

#### Example

    <iq id="9JeHy-74" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="location">
       <RelocateUser location="Backoffice"/>
      </cmd>
    </iq>

#### Usage
* location is mandatory and must contain a valid mobydick location name, use location.Find to search possible target locations.

### location.LogoutUser
Tells mobydick that the currently authenticated user is signing off from their current location. The direct response is a base.Success accompanied by either a location.SetLocation event or base.Failure.  

#### Example

    <iq id="9JeHy-74" type="get">
      <cmd xmlns="http://www.pascom.net/mobydick" module="location">
       <LogoutUser/>
      </cmd>
    </iq>

## Responses
### location.LocationList

A location.LocationList response contains a number of Location elements. 

#### Example

    <iq id="9JeHy-73" to="tweber@mobydick/mdfxclient_tw-macbook.in.pascom.net" type="result">
      <cmd xmlns="http://www.pascom.net/mobydick" module="base">
       <LocationList>
        <Location name="Support" isstatic="false" username="tmattausch"/>
        <Location name="Sales" isstatic="false" username="mpasquay"/>
        <Location name="Backoffice" isstatic="false" username=""/>
        <Location name="Development" isstatic="false" username="tweber"/>
      </LocationList>  
      </cmd>
    </iq>

#### Usage
* If sent as a response to location.Find, it'll contain no device specific details, instead a stripped down version is used. 
* username: who is currently using this location. If you decide to perform a location.RelocateUser on the username, you'll kick this user out of this location.

## Events
### location.SetLocation
You can subscribe to this event if your application needs to now if the authenticated user is switching to another location.

#### Example

    <message to="tweber@mobydick/mdfxclient_tw-macbook.swe.local" from="pbx.mobydick">
     <cmd xmlns="http://www.pascom.net/mobydick" module="base">
       <SetLocation eventType="login" eventId="">
        <LocationList>
          <Location name="Thomas Weber" isstatic="true" username=""/>
          <Location name="Entwicklung2" isstatic="false" username="">
            <DeviceEntry delayinternal="0" timeoutinternal="20" delayexternal="0" timeoutexternal="20" delayqueue="0" timeoutqueue="20">
              <Phonedevice name="Snom 000413411c47 [Entwicklung2]" type="Snom Phone">
                <capabilities>
                  <conference/>
                  <dial/>
                  <factory_reset/>
                  <firmware_update/>
                  <hangup/>
                  <hold/>
                  <transfer/>
                  <offhook/>
                  <reboot/>
                </capabilities>
              </Phonedevice>
            </DeviceEntry>
          </Location>
        </LocationList>
      </SetLocation>
    </cmd>
    </message>

Some notes:

* SetLocation contains one or two Location elements. 
* The first one (isstatic=true) is always included and denotes the users fixed set of devices. It should contain a personal DECT handset or a mobile phone which are not typically bound to a physical location/desktop.
* the second Location element is optional and contains the currently used flexible location
  * within the Location elements you see a set of DeviceEntry containers holding the effective timing parameters for each device.
      * a Phonedevice finally shows a assigned hard- or softphone with its name and supported capabilities 