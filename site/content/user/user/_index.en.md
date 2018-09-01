---
title: Users and Locations
description: What is an user and what is a location in pascom phone systems and how can you add and manage them quickly and efficiently?
weight: 22
---

{{< doctype "both" >}}

{{< description >}}

## Concept

### Users

pascom user accounts represent **real people** and not devices. An extension is assigned to the user, not the telephone. Each user has 2 **presence statuses**:

* **Telephone status**: displays the user's telephone status, whether it is available, ringing or in call..
* **Online / client status**: displays a user's online status i.e. whether they are available, away or in DND.  Also indicate in which location a user is logged in and whether they are on a PC or mobile device

If multiple devices are assigned to a user or they are using multiple PCs or smartphones at the same time, their presence states are aggregated.
<!--Image update-->
![Illustration - Concept pascom User](user_overview.en.png?width=90% "pascom User Concept")


### Directly Assigning Telephones to Users

In the simplest scenario, telephones are directly assigned to users. All assigned devices can then be reached by dialing the user's extension. The order in which and for how long assigned user devices should ring is defined using the [FollowMe]({{< relref "#follow-me">}}) settings.
<!--Image update-->
![Illustration - User with devices](user_desktop_personal.en.png?width=50% "User with devices")

This is the recommended option should users not switch workplaces in the office, as only the administrator can change telephone assignments and not the users themselves.

### Using Locations

However, should you have users who regularly switch workplaces (hotdesking) or work from home office, it is best to assign telephones to **locations** instead of users. Phones can not only be assigned to a user, but also to a virtual location. Users can then use the pascom Client, pascom Mobility Client or the menus on their desktop IP phone to select the location they want to work from. As soon as a user has signed in to a location, all telephones assigned to that location will become reachable under the user's extension. The order in which & for how long the devices ring can be configured for the individual work location.

A user can only be logged into to a single location at any given time. In the default setting, every user can sign in to every location. If you do not want your users to sign in to arbitrary locations, you need to create restrictions using **roles**.

In the example below, we created two locations for the Manager, one location in their office, the other in their home office.

<!--Image update-->
![Illustration - User and locations](user_desktop_public.en.png?width=50% "User and locations")

### Combining the "directly assigned" and the "location" concepts

It is possible for a user to use simultaneously use a work location and directly assigned telephone, i.e. a mobile phone / device.

If users switches their location, the directly assigned user device is not affected and continues to be reachable.

<!--Image update-->
![Illustration - User mixed](user_desktop_mixed.en.png?width=50% "User mixed")

## Configuration

### Adding Users

To add a new user, login into the admin Web UI and go to `Users` > `User list` and click `Add`

Next, simply complete the quick user add form with the information below:

|Setting|Description|
|---|---|
|**Login name**| Lower case letters only are permitted and is used for logging into the pascom clients.|
|**Display name**|Name to be displayed to other pascom phone system desktop and mobile client users.|
|**Extension**|Extension number under which the user should be internally reachable. Should the ext also be externally reachable, please use an extension from your number block.
|**Authentication**|Determines how the user is authenticated when logging into the pascom client. Options include: <br>* *pascom* if the password should be saved by the pascom phone system. <br>* *External/LDAP* if the password authentication occurs via a 3rd party application. <br>* *None*|
|**Password**| Must be a minimum of 8 characters. The password is required to log on to the pascom client and can be changed via the user within the client.|
|**PIN**| Minimum of 4 numerical digits, the PIN is used to log on to a telephone, access voicemail boxes etc.|
|**Fax extension**|Enter a number here to automatically assign the user with a virtual fax device.|
|**E-mail address**|User e-mail address used for sending incoming faxes and voicemails to the users e-mail.|
|**Preferred language**|Set the preferred language in which the user should hear system prompts.|
|**User Voicemail Box**|Per default, each user is added with a voicemail box. This setting can be used to automatically activate the user's voicemail box and add the corresponding voicemail call flow action. <br>* *Don't use*: no actions added. <br>* *External Calls* adds an external/after action. <br>* *Internal Calls* adds an internal / after action. <br>* *All Calls* adds both internal and external / after actions.|
|**Enable pascom softphone**| Automatically adds and enables a pascom softphone.|
|**Has a mobile phone**| Automatically adds a mobile device for the user.|

Once finished with adding users, simply click on the following:   

* **Save** in order to save your user changes and go back to the user list.   
* **Save and Details** in order to save your changes and edit additional details.  
* **Save and Next** in order to save user changes and start adding the next user.   

#### Add Users Using the .xlsx Import

For the purposes of the initial installation, importing users via a .xlsx file is a very good option. The file *UserImport* can be found under `Appliance` > `Import` >`User Import`. Simply download the template, fill it out and upload it. Please take note of the instructions within the file.

Alternatively, you can use the *Advanced Import* option (`Appliance` > `Import` >`Advanced Import`). This option enables you to configure additional settings whilst adding the users:

* Assign IP telephones
* Assign pascom softphone
* Assign action templates
* Add work locations
* Create a global telephone book
* Define speed dials

As with the user import, please note the instructions contained within the file.

{{% notice warning %}}
Only use the user import option once during the initial setup of your pascom phone system. Additional users must be added manually. Further user imports using the user import options will overwrite the already added users.
{{% /notice %}}

### Web-UI Permissions

As standard, only your pascom Administrator can log in to the Web UI. However, you can assign administration rights to any number of user, should you need to do so. Currently, there are 3 additional administration rights levels available:

|Role | Permissions |
|------|----------------|
|**System Administrator**|Highest level - has all available permissions.|
|**Administrator**| Like System Administrator however **without**: </br>- pascom Update </br>- Full ISO Backup </br>- Reboot </br>- Network configuration </br>- Cluster Management|
|**PBX-Manager**| Like Administrator however **without**: </br>- Gateways/Expansion Cards/Trunks </br>- Restarting of services </br>- Restoring Database </br>- End User Device Firmware rollout </br>- pascom Connector </br>- Cronjob Management|
|**Phonebook Manager**|    The user is permitted to edit the pascom phonebook|

### Voicemail Box

Each user is automatically configured with a voicemail box. Per default, the voicemail box exists, but callers will not be transferred to it.

Firstly, voicemail handling must be configured. Under `Users` > `User List` > select an user and click  `Edit`. Under the `Basic Data` tab, you will be able to change the following settings:

|Settings|Description|
|---|---|
|**Save Voicemails**|**YES** means that the voicemails will be saved to the pascom phone system after they have been listened to or sent via email. Older voicemails can be cleaned via a Cron Job.<br>**NO** means that the voicemails will not be saved to the pascom phone system once sent / listened to. This is the recommended setting in that Voicemails required significant storage.|
|**Voicemail Email**|The E-mail address to which voicemails should be sent.|
|**Monitored Voicemail Box**|Per default, the user's individual voicemail box will be monitored. It is however possible to choose to monitor voicemail boxes from other users.|

Finally, a Voicemail box action must be added should this not have already been done during the add user stage.

### Alternative CallerID (CID Number)

When adding a user, the user will be assigned with their individual extension under which they can be called. Normally this extension number will also be displayed to other system users. Should your requirements differ, it is possible to configure an alternative caller ID / CID number under `Users` > `User List` > select the required user and click `Edit` and under the `Basic Data` tab enter the alternative **CID Number**.

{{% notice tip %}}
Should a user use /signal a different extension for external calls, please configure this in the trunks menu under outbound calls.
{{% /notice %}}

### Phonebook

For each user, a **phonebook** entry is added containing both their **display name** and **extension**, although additional details may also be added. The entry can be called up from either the pascom Client, Mobility Client or IP telephones.  

It is also possible to **deactivate** an entry, for example should a member of the management team require that their phonebook entry not be visible to other users.

User phone book entry settings can be found and modified under `Users` > `User List` > select the required user and click `Edit` and then the `Phonebook` tab.

<!--For more details, please see //FixMe Link Maintaining the Central Telephone Book.-->

### Virtual Fax Devices

Under `Users` > `User List` > select the required user and click `Edit` and then the `Fax Device` tab, it is possible to add and assign a virtual fax device for this user.

|Setting|Description|
|---|---|
|E-Mail|Email address used for Fax-to-Email, i.e. receive faxes and notifications regarding sent faxes.|
|Extension|The extension under which the fax number is reachable.|
|Outgoing Fax ID|Fax ID number printed on the sent fax.|
|Format|Enter the format in which the user should receive the fax per e-mail.|

### Endpoints / Devices

Under `Users`> `User List` select the required user and click `Edit` and then the `Devices` tab, it is possible to assign devices to the selected user. On the left hand side of the screen, an overview of all available devices will be displayed. Using the blue arrows, it is possible to select the desired telephone and add it to the assigned device list (the right hand column).  If the device is no longer required by the user, use the left arrow to move the device back to the available devices column on the left.

Users can be assigned with any number of devices. Which endpoint should be used to make and receive calls can be determined via the pascom desktop client.

Assigned devices can be assigned with timeouts / FollowMe settings as follows:

|Timeouts|Description|
|---|---|
|**Internal Delay**|After how many seconds the device should start ringing for internal calls.|
|**Internal Ring**|For how many seconds the device should ring before the caller is handled by an Internal / After action.|
|**External Delay**|After how many seconds the device should start ringing for external calls.|
|**External Ring**|For how many seconds the device should ring before the caller is handled by an External / After action.|
|**Queue Delay**|After how many seconds the device should start ringing when the user receives a call via a queue, i.e. is logged in as team agent in a call queue.|
|**Queue Ring**|For how many seconds the device should ring when the user is called via a team. N.B. this timeout setting will overwrite the team timeout setting.|

User timeouts must be set per device and per user.

### Locations

Under `Users`> `Locations` > `Add` it is possible to add a location (i.e. HomeOffice, Office Location, specific workstation etc). Under the `Devices` tab it is possible to assign devices to the location (multiple devices can be assigned to a location).

Under the `User Assignment` tab, you can assign the location to users. The location user assignment can also be left empty once added. Users can login into the location using their telephone or via the pascom client.

|Login into a location:||
|---|---|
|**Using the pascom client**|Above the profile picture on the left of the client it is possible to select a location <br> Should you often work from the same locations, these will be displayed via the dropdown list. <br> Otherwise, click on the softphone menu and under my devices it is possible to select from a list locations.<br>If you wish to log out of a location, simply select *None/roaming* |
|**Using an IP Telephone**|IP telephones which are provisioned by your pascom phone system will have a pascom menu key assigned. Press this key and select *login*. Enter your extension number followed by your 4 digit PIN number.<br>To log out, press the pascom menu key and select *Log out*|

Under `Users`> `User List` select the required user and click `Edit`. Under the `Locations` you can then assign Locations to users plus seeing in which locations users actually work.

### Call Forwarding (Server Based)

An overview of call forwarding can be found under `Users`> `Call forwarding`, which will display all call forwards which have been setup by your users, regardless of whether they are currently active or inactive. It is also possible to add new call forwards via this menu option.

{{% notice warning %}}
Call Forwarding should be setup using your pascom phone system (i.e. pascom client or the pascom menu key on your IP phone). Doing so will avoid uncontrolled, never ending forwarding loops.
{{% /notice %}}

### Actions

Actions are an important pascom phone system component which help control call flows. Actions ensure that it is possible to:

* play back prompts to the caller,
* direct callers to voicemail boxes outside of office hours,
* direct a call to another user or team should the called party currently be on a call or not available,
* plus much more.

For more information, please refer to the [Actions article]({{< ref "acd/actions" >}}).

### Roles

Users, devices, locations and teams can all be members of one or more role groups. The role itself can be assigned with settings and permissions, making it possible for example to manage telephony relevant settings such as allowing call pickups from other users.

Roles can be configured via the `Users`> `Roles` menu.

There is a special **Role** called **All Users**, which as default is assigned to all Users, devices, workstations and teams and can not be removed.

A very common practice (and our recommendation) is to create one role per department or team. For example, you may wish that users can pick up calls only from within their department and for this to been mutually seen within the pascom client. In order to do this simply disable the *xmpp.group* properties of the "All" Role and assign a new role, e.g. Support in which you can set all the Support Users as members

|Role Type|Description|Influence|
|---|---|---|
|**billing.group**|Accounting groups of the Billing Modules. Services used for grouping call data.|Users, Call Groups, Queues|
|**xmpp.supervisor**|Users with this role can manage conversations pertaining to all users. This is important for the FlexPanel and TAPI.|Users|
|**location.group**|With this role, users and locations can be added. Only users can log themselves into locations which belong to a role type location.group. Please note, that as soon as a role with the location.group properties has been setup, a corresponding role for all users and locations must also exist. Otherwise, users without this role will not be able to log into any location|Users and Locations|
|**pickup.group**|All direct members of the role have the right to pick up incoming calls directed to another member of the group. This can then be done either via the Telephone \*8<extension> or via the Client.|Users, call groups & queues|
|**redirect.choice**|An identity with this role type will never be redirected by a server based call forwarding, but rather always calls the direct destination.|Users|
|**xmpp.group**|All Users that have been assigned a role with the role type *xmpp.group*, will be linked together in a *XMPP shared group*. That is to say the clients in the contact list do not have to mutually add themselves, but will be immediately visible to one another. Should you assign the property *xmpp.group* to the role All Users, everyone will always see everyone in the Client..|Users|


### Follow Me

Users and workspaces (locations) can be assigned with multiple Endpoints. The configuration setup regarding which endpoint rings, when and for how long is know as **FollowMe**.

![FollowMe](followme.en.png "pascom FollowMe Concept")


## Configuration

A prerequisite for the configuration is that users have already been added and that a minimum of one endpoint has been assigned.

Within the Web UI, click on `User` > `Userlist` > select user > and go to the `Devices` tab. In the right hand column, you will see an overview of the directly assigned devices with the corresponding FollowMe settings. Next, click on the FollowMe setting:

![FollowMe](followme_webui_settings.en.png?width=50% "FollowMe pascom Web UI")

|Setting|Description|
|---|---|
|User Configurable|**Yes/No**: Admins can define whether a user is able to change FollowMe settings on each assigned device.|
|Enabled|**Yes/No**: Whether the endpoint should ring or not for inbound calls.|
|Delay|Time in seconds before the device should start ringing for inbound calls.|
|Timeout|Time in seconds that the device should ring for.|

FollowMe settings can be configured for

* **Internal**: for internal calls, i.e. from phone system users,
* **External**: Inbound calls via a Trunk, i.e. originating outside the phone system
* **Queue**: Inbound queue calls to users logged in as a queue agent.

### FollowMe UC Client Set up

If a user is permitted to manage their FollowMe settings, this can be done via their pascom Desktop UC client (`Settings` > `FollowMe`).

![FollowMe](followme_settings_client.en.png?width=100% "User Defined FollowMe")

Users can configure individual FollowMe settings for internal and external calls as well as calls originating via a queue / team. To do so, the user must simply toggle between the `External`, `Internal` and `Teams` tabs.

|Settings|Description|
|---|---|
|**Client controls**|Should a user be assigned with multiple devices, with this drop down menu, it is possible to set up which endpoint (device) the desktop client can control.|
|**My Devices**|List of all devices assigned to the user. Telephones which the user is not permitted to configure FollowMe settings are greyed out.<br>The user can activate / deactivate devices and define whether a phone should ring or not as well as defining a device specific **Delay** and **Timeout**.|

A graphical overview of the user defined FollowMe settings is available in the column on the left showing device specific delays and timeouts.

<!--FIXME wenn Client fertig übersetzt ist Felder nochmal prüfen -->
<!-- ### Followme über den Mobility Client steuern -->
<!--FIXME mobility client!!!  -->