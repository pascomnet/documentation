---
title: Users and Locations
keywords: 
    - Users
    - SIP User
    - IP work locations
    - Roaming User
    - Hotdesking
    - Add Users
    - Add Locations
description: Was ist ein Users, Arbeitsplatz in mobydick und wie lassen diese sich einfach einrichten und verwalten?  
linken: /benutzer/benutzer-und-arbeitsplaetze/
url: /users/users-and-locations
prev: /users/
next: /users/add-teams/
weight: 22
toc: true
---

## Concept

### Users

mobydick user accounts represent **real people** and not devices. An extension is assigned to the user, not the telephone. Each user has 2 **presence statuses**, one for their **telephone** and the other their **Online Availability**. This allows other mobydick Client users to see whether a particular user is currently on the phone, working at their PC or available on their smartphone. If multiple devices are assigned to a user or they are using multiple PCs or smartphones at the same time, their presence states are aggregated.

![Illustration - Concept mobydick User](../../images/user_overview.png?width=90% "User Concept mobydick")


### Directly assigning telephones to users

In the simplest scenario, telephones are directly assigned to users. All assigned devices can then be reached by dialling the user's extension. User settings control in which order devices ring and for how long each device should ring. The default setting is for all assigned phones to simultaneously ring for 20 seconds

![Illustration - User with devices](../../images/user_desktop_personal.png?width=50% "User with devices")

This is the preferable method to be implemented if users do not switch workplaces in the office, as only the administrator can change assignments for each of the telephones. If, however, users need to switch workplaces or if they occasionally work from their home office, it is best to assign telephones to **locations** instead of users.

### Using Locations

Phones can not only be assigned to a user, but also to a virtual location. Users can then use the mobydick Client, mobydick Mobility Client or the menus within the SNOM, Aastra or Yealink devices to select the location they want to work from. As soon as a user has signed in to one location, the user's extension can be used to call all telephones assigned to that location. The order in which the devices ring and the duration of the ringing can be configured from the individual workplaces. The default setting is for all assigned telephones to ring simultaneously for 20 seconds.

A user can only be assigned to a single location. In the default setting, every user can sign in to every location. If you do not want your users to sign in to arbitrary locations, you need to create restrictions using **roles**.

In the example below, we created two locations for the Manager, one location in their office, the other in their home office.
 

![Illustration - User and locations](../../images/user_desktop_public.png?width=50% "User and locations")

### Combining the "directly assigned" and the "location" concepts

It is possible for a user to use their extension with a location and at the same time to use a phone that is directly assigned to the user.
This would make sense for devices owned by the user that they can carry with them, e.g. mobile phones, tablets etc.
If users switch their location, this does not change anything for the phones that are directly assigned to the user.

![Illustration - User mixed](../../images/user_mixed.png?width=50% "User mixed")

## Configuration

### Adding Users

To add a new user, click the //FixMe button within the User panel.
![Screenshot - Adding User](../../images/user_Quick_edit.png?width=90% "Adding User")

The **login name** (lower case letters only) and **password** are required by the user to log on to the mobydick Client or mobydick web interface. The numeric **PIN** can be entered easily using only the telephone touch pad and is used to access voicemail boxes or to sign in at a location etc.

The **display name** is what other users see when they receive a call from that user.

**Extension** is the number under which the user is reachable internally

If a number for the **fax extension** is entered, a virtual fax service will be automatically created.

**E-mail address** is used in order to to send incoming faxes and voicemails to the users e-mail.

A voicemail box is created for each user as default. The default setting is to not route an incoming call to the user's voicemail box, however this setting can be changed by using and activating the **Use voicemail box**:

|Parameter | Bedeutung |
|----------|-----------|
|Do not use it |(default) Incoming calls are not forwarded to the voicemail box.|
|For external calls|Incoming calls from **outside of the network** are forwarded to the users' voicemail box if the person called is on the phone or does not answer the call. Accounts using the **External / After** settings will automatically be handled according to the settings applied.|
|For internal calls|Incoming **internal** calls are forwarded to the voicemail box of the person called if the they are on the phone or not available to answer the call.  Accounts using the **Internal / After** settings will automatically be handled according to the settings applied.|
|For all calls| **All** calls are forwarded to the voicemail box if the person called is on the phone or not answering. //FixMe Actions of the types **Internal / After** and **External / After** are automatically created to handle this scenario.|

Enabling the **mobydick Softphone** will mean that the user will automatically be created with a mobydick Software Telephone. This will enable the user to use the //FixMe mobydick Client exactly like a normal desktop telephone.

Save your changes and review the user details:
![Screenshot - edit user in mobydick](../../images/user_edit.png?width=90% "User edit")

This screen contains the basic data you have just entered in the previous step. Additionally, you can enter a **CID number**. As standard, an internal person who is being called will usually see the the caller's extension on the telephone display. If a **CID number** has been defined, this number will be displayed instead of the extension number.

In our example, Manager Max might not want to display his own extension but that of his secretary Maria when making call. To do so, he can enter 100 as the **CID number**. If someone was to then call back at a later time dialling the extension 100, Maria will pick up the call as Max' extension is still 120.

### Web-UI Permissions

As standard, only your mobydick Administrator log in to the Web UI. However, you can assign administration rights to any number of user, should you need to do so. Currently, there are 3 administration rights levels available:

|Rolle | Berechtigungen |
|------|----------------|
|System Administrator|Highest level - has all available permissions.|
|Administrator| Like System Administrator however **without**: </br>- mobydick Update </br>- Full ISO Backup </br>- Reboot </br>- Network configuration </br>- Cluster Management|
|PBX-Manager| Like Administrator however **without**: </br>- Gateways/Expansion Cards/Trunks </br>- Restarting of services </br>- Restoring Database </br>- End User Device Firmware rollout </br>- mobydick Connector </br>- Cronjob Management|
|Phonebook Manager|    The user is permitted to edit the mobydick phonebook|

### Voicemail box

The **Save voicemail** option allows you to choose whether voice messages should be saved to disk. If the field **Voicemail E-Mail** contains an e-mail address, new voice messages are automatically forwarded to that address.  

The **Monitored voicemail box** allows you to select a user who can administer the mailbox using either the mobydick Client, Mobility Client or an IP telephone. For more details, please see //FixMe voicemail box.

### Phonebook

For every user, an entry is added to the **phonebook** containing both their **display name** and **extension**, although additional details may also be added. The entry can be called up from either the mobydick Client, Mobility Client or IP telephones.
It is also possible to **deactivate** an entry, for example should a member of the management team require that their phonebook entry not be visible to other users. For more details, please see //FixMe Maintaining the Central Telephone Book.

### Fax devices
You can assigned a personal fax device to a user. For more details, please see //FixMe Virtual Fax Server.

### Assigned Devices
You can assign personal devices to a user.
![Screenshot - Assigend devices in mobydick](../../images/user_devices.png?width=90% "Devices in mobydick")

Any number of devices can be assigned to user. The default setting for all assigned devices is to ring simultaneously for 999 seconds. To learn more about **Waiting** and **Ringing** settings, please see the //FixMe Concept: Followme. If the call is not answered, the actions **After / External** or **After / Internal** will be applied. See the chapter on the concept of //FixMe actions for more details.
//FixMe

### Location

Using the location tool allows you to assign a location to the user as well as seeing the location the user is currently working from.
A user can only use a single location at any time, however several telephones can be assigned to the location.

### Roles

Allows you to define which //FixMe roles apply to the relevant users for a particular use. For further details please see roles. //FixMe

### Actions (internal, external, before, after)

Actions allow you to the manage the call flow. For more details please see //FixMe the chapter on actions and //FixMe Call Flow Management.


### Creating locations (optional)
In the menu Users > Locations, create a new location by clicking the //FixMe  button.
![Screenshot - location in mobydick](../../images/user_location.png?width=90% "apply location")
The location only requires a label to allow assignment of devices to it

You can now assign users although this can also be done by the users themselves by using mobydick Client, MobilityClient or by using the menu keys on the their SNOM, Aastra and Yealink telephones.

### Importing Users and Locations

If you have a relatively large amount of users, you can import the users and automatically assign telephones and locations. Please see Importing Data for details. //FixMe


## Roles and given special rights or properties

### Concept
**Users**, **Devices**, **Work Stations** or **Teams** can all be members in one or several Roles. The Role itself can allocate **properties** and **Roles**.
Roles control the "Telephony relevant" properties and rights such as the ability to see and "pick up" conversations from other Users etc, and can also contain not only Users but also devices, workstations and teams as members.  

### Special Role "All"
There is a special **Role** called **All Users**, which as default is assigned to all Users, devices, workstations and teams and can not be removed.

### Setting Roles per Department
A very common practice (and our recommendation) is to create one Role per department or team. For example, you may wish that users can only pick up calls only from within their department and to for this to been mutually seen within the MobyDick client. In order to so this simply disable the xmpp.group properties of the "All" Role and assign a new role, e.g. Support in which you can set all the Support Users as members

### Properties and Rights
#### location.group
With this role, users and locations can be added. Only users can log themselves into locations which belong to a role type location.group. Please note, that as soon as a role with the location.group properties has been setup, a corresponding role for all users and locations must also exist. Otherwise, users without this role will not be able to log into any location. 

Influences: Users, Locations

#### billing.group
Accounting groups of the Billing Modules. Services used for grouping call data.

Influences: Users, Call Groups, Waiting lines

#### xmpp.supervisor
Users with this role can manage conversations pertaining to all users. This is important for the FlexPanel and TAPI

Influences: Users

#### pickup.group
All direct members of the role have the right to pick up incoming calls directed to another member of the group. This can then be done either via the Telephone *8<extension> or via the Client.

Influences: only Users

#### redirect.choice
An User with this role type will never been diverted from a system-based call forwarding protocol, but will always call the direct target.

Influences: User

#### redirect.group
Define a system based role for call forwarding and call forwarding groups.

Influences: only Users.

#### xmpp.group
All Users that have been assigned a role with the role type xmpp.group, will be linked together in a XMPP //FixMe shared Group. That is to say the clients in the contact list do not have to mutually add themselves, but will be immediately visible to one another.  Should you assign the property xmpp.group to the role All Users, everyone will always see everyone in the Client.

Influences: only Users.

## Concept: Followme
Users and work stations can have multiple telephones assigned to them. The configuration as to which telephone rings, when and for how long is called **Followme**. 
![Illustration - Concept Followme mobydick](../../images/user_followme.png?width=90% "Devices follow you")

Every telephone can be setup with **Waiting** and **Ringing** parameters valued in seconds.

**Waiting** defines the amount of time between an incoming call and the time that that telephone should begin to ring. 

**Ringing** defines how long the telephone should be called. 

Additionally you can handle internal calls differently to external calls as well as calls which should reach your Team Agents. Therefore, there is the according **Waiting** and **Ringing** parameters per Telephone for **intern, extern** and per **Agent**.

Currently the Followme concept can only be set by the Administrator. In future versions, this should be also possible to do by the users
