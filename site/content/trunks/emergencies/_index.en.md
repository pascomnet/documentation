---
title: Emergency Calls
description: How to manage emergency numbers with the pascom phone system and ensure that the correct location is transmitted to the control centre.
weight: 121
---

{{< doctype "both"  >}}

{{< description >}}

## Emergency Calls and VoIP

In the world of modern IP communications, it is possible to establish a voice call via the internet from almost any location. However, this makes the transmission of the exact caller location (location tracking) to the emergency control centre (dispatch center) that much more difficult. 
This applies to both SIP trunks and for internal pascom telephony services.

## Trunks (SIP Provider)

As a general rule, SIP providers use the address of the contract owner - i.e. the address where the services are installed / delivered - or a pre-defined assigned location. 
When using internet access coupled with SIP connections (e.g. Deutsche Telekom), a general rule is that the location of the DSL-/FTTH-line is transmitted. Please refer to the information hints found in our [Trunk Templates]({{< ref "/trunk-templates" >}}) documentation. 

{{% notice warning %}}
**Please always speak to your SIP trunk provider in order to ensure how the location tracking works and how it will be transmitted to the control centre during an emergency call. This is especially important if you have consolidated multiple SIP trunks one location or use the pascom cloud.**
{{% /notice %}}

## Internal Participants

Location tracking for companies with multiple locations, field-based, and HomeOffice employees is often unclear. In such circumstances, we recommend using mobile phones for emergency calls. 
In order to remove any potential errors, the [pascom Mobile Client]({{< ref "/clients/mobile-userguide" >}}) exclusively uses GSM to make emergency calls as this provides the exact caller location. 

{{% notice warning %}}
**Instruct all remote users (HomeOffice etc.) to make emergency calls using their mobile phones and NOT the pascom desktop client or a hardware phone. Alternatively, please ensure that the used SIP trunk transmits the actual location.**
{{% /notice %}}

## Standard Emergency Service Numbers

An emergency call to alert the emergency services (Ambulance, Police and Fire) should always be routed without any modification to the Calling Line Identification/phone number.  
Since 11. February 1991, the European emergency number 112 has been in force across all countries within the EU and EFTA (European Free Trade Association), as well as Russia, Ukraine and a number of other countries.


## Add Further Emergency Numbers

Should your pascom solution be installed, deployed or used in a country outside of the EU or EFTA that does not support or use the standard European emergency number or you want to include country-specific emergency numbers within your pascom solution, this can be done the admin web UI. Under {{< ui-button "Advanced" >}} > {{< ui-button "Emergency numbers" >}} > {{< ui-button "Add" >}} simply expand the pool of emergency numbers added to you pascom phone system.

The phone system will then be configured to directly reach these phone numbers via your configured trunk regardless of any other configured rules or in-prefixes. 

Per default, the following emergency numbers are configured on the pascom phone system:

|Emergency Number|Description|
|---|---|
|110|Old Emergency Number|
|112|European Emergency Number|

{{% notice info %}}
The [extensions]({{< ref "/howto/extensions" >}}) 110 and 112 are not permitted to be assigned for other internal purposes, as these relate to emergency numbers that must be intuitively available to every phone system user.
{{% /notice %}}