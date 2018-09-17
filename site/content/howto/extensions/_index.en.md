---
title: Setup Extensions
description: How to setup and use extensions in your pascom phone system.
weight: 120
---

{{< doctype "both"  >}}

{{< description >}}

## Concept

An extension is the component of a phone number with which a user or team can be reached directly. Extensions in a pascom phone system are also used for fax devices and / or speed dials (i.e. when calling an external mobile number via an extension) as well as an extension switch which can be dialled to activate / deactivate specific actions.

## Extensions Pool
<!-- FIXME extension-pool ersetzen -->

Should you have not yet considered the extensions that you would like to configure, then you can use the extension pool, the default values for which are defined under the system settings. These defaults can of course be modified to meet your requirements. The extension numbers will then be assigned incrementally starting from the starting number and should an extension number already be manually assigned, this number will be automatically skipped.

Modifying the default values can be done Within the system settings. In the admin Web UI, simply search for the term *extensionpool* using the search box:

|Parameter|Description|
|---|---|
|011account|user extensions |
|029team|Team extensions|
|020faxdevice|virtual fax extensions (for users and teams)|
|042speeddial|Speed dial extensions|
|009extension|miscellaneous extensions (i.e. for extension switches, scripts)|

The default values within the system settings are 3 digits in length, even if you specify that you use 2 digit extensions when adding a SIP trunk. Therefore, please adapt these default values to match your phone numbers.

## Extension Number Distribution

Whether to use 2, 3 or 4 digit extensions relates naturally to the number of users as well as the number block as received from your provider.
In general, it is simpler to increase the number of extension digits compared to decreasing the extensions length.
Everything that should be reachable direct under the phone number / extension from internal & external sources must be included in the number block from your provided.

{{% notice info %}}
**Please consider the following when adding extensions:**<br>
- The 0 extension is not permitted to be internally assigned.<br>
- Internal extensions cannot start with a 0.<br>
- Single digit extensions are not permitted.<br>
- The extension 110 and 112 are not permitted in that they relate to emergency numbers.
{{% /notice %}}

In certain cases, some extensions such as extension switches, door intercoms, conference rooms etc should not be externally reachable in that they are intended for internal use by employees. When using such extensions in combination with for example a 3 digit number blocks, these extensions should have a longer digit length.

### Example

The company Chaoscomputing has three departments, switchboard (reception, central...), Sales and Technical Support.

Town prefix + originating number: 020312345.

A number block from -0 to -999 is available.

3-digit extensions are to be used for the users and each user has a virtual fax device with an individual internally reachable fax extensions. Externally, the company fax number of 555 will be signalized.

**Switchboard:**

* The switchboard which is normally externally reachable under the -0, will be added as a queue internally using the extension 100.
* The virtual company fax 555 can be then assigned to the switchboard team.
* Switchboard employees are then assigned with the extension 101 - 199.

**Sales:**

* The sales team queue extension number is 200.
* Sales employees are then assigned with the extension 201 - 299.

**Technical Support:**

* The technical support team queue extension number 300.
* Technical support employees are then assigned with the extension 301 - 399.

{{% notice note %}}
Through the extension number block distribution method, it is possible to mask the individual extensions behind the department service numbers using outbound rules under [Trunks]({{< relref "/trunks/rules">}}), meaning the called party would not see the internal extension numbers but rather the department / team extension number.
<br><br>**Example:** All users signalize the -0 switchboard extension externally<br>
*Source: _1XX.*<br>
*CIDNummer: 0203123450*
{{% /notice %}}

**Virtual Fax (Users):**

Each user can send faxes using their individual virtual fax number. This is achieved through placing a 9 before the extension number.

Example: 9123 for the user fax with the extension 123.

By configuring an outbound call rule under [Trunks]({{< ref "/trunks/rules">}}), it is now possible to config all outbound faxes to signalize the company fax number:

*Quelle: _9XXX.*<br>
*CIDNummer: 020312345555*
