---
title: Telephone Book
keywords:
    - pascom PBX phonebook
    - phonebook
    - 
description: pascom Phone Systems come with an integrated central phone book, simplifying contact management and phonebook admin.
linkde: /benutzer/telefonbuch/
url: /users/phonebooks/
prev: /users/add-teams/
next: /users/connector/
weight: 24
toc: true
draft: false
---


## Concept

### Global Telephone Book

As standard, pascom phone systems provide every user with a central telephone book, which can be accessed via the desktop client on Windows, Mac and Linux operating systems as well as via the mobility client for Android and iOS smartphones and devices. In addition, pascom [VoIP Software](https://www.pascom.net/en/mobydick-voip/ "pascom VoIP phone system software") supported IP phones which have been provisioned by the phone system are also able to call up the central telephone book.

### Private Telephone Book
Each desktop client user has access to a private Phonebook for storing user specific contact information:

* Allows new phone book entries to be added via the desktop client.
* Should an unknown caller call, the entry can be stored in the private phone book.
* Entries from the global telephone book can be copied into the private and then edited.


## Using the Global and Private Telephone Books

pascom phone systems use the telephone books in order to resolve inbound and outbound phone numbers which are then transmitted via the SIP protocol to all SIP endpoints, ensuring that Caller Names are provided to all IP endpoints.

### Handling the Different Telephone Books

* Each pascom phone system user has read only access to the global phone book.
* The global telephone book can be edited by system users you have at least `Phonebook Manager permissions (see
[Web UI Permissions](../users/#web-ui-permissions)).
* Each phone system user has read / write access to their individual private phone and not those of other users.

### Telephone Book Prioritization for Inbound Calls

* BY inbound calls, the number is searched for firstly in the private phone book before searching the global phone book. If a number is stored in the private phone book, this number will be the number displayed.
* Should a queue be called and only one agent has the number stored in their private phone book, then only this agent will see this entry in the display dialog.

## User and Team Telephone Book Entries

The phone system allows all users and teams to be assigned with a phone book entry, which can be managed directly under the `Telephone Book` tab under the user / team object. If needed, it is possible to prevent a phone book entry being added (i.e. for CEO or Managing Directors). To do so, simply deselect the *create phonebook entry* check box. If the box is active, a the extension and display name will be automatically added to the phone book.  

In addition to the display name and extension, it is also possible to add additional information including Forename, Surname, E-mail address and mobile numbers etc..

## Manually Maintaining External Telephone Book Entries

Within the Web UI, select the menu options `Users` > `Phonebook` and click `Add`.

|Field|Description|
|---|---|
|**Display Name**|
This name will be shown in the phone display, Desktop Client and Mobility Client.<br>In order to provide as much detailed information as possible, it is possible to add company names, customer IDs to the user's display name.<br>E.g. Max Muster - pascom [3000]|
|**Phone**|Phone number in international format<br>*Beispiel:*+44 203 1234567|
|**First Name**|Contact forename.|
|**Last Name**|Contact surname.|
|**Organisation**|Company name to which the contact can be allocated to|
|**Fax**|Fax number in international format.|
|**Email**|Contact e-mail address.|
|**Mobile / Cell**|Mobile / cell phone number in international format|
|**Phone (private)**|Private number in in international format.|
|**Notes**|Any notes to this contact - will be visible in the desktop client.|

## Importing External Telephone Book Entries

It is also possible to automatically import contact data using the pascom phone system's [Connector](../connector) tool.
