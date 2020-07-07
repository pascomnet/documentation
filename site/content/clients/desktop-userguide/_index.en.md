---
title: Desktop Client User Guide
description: The pascom Desktop Client User Guide is designed for end users and provides a step-by-step guide to using the clients VoIP Telephony and Unified Communications functions. 
weight: 30
---


{{< doctype "both" >}}
 
{{< description >}}

<!-- FIXME - bilder nur mit hellem theme! -->

<!--FIXME
- Amtsholung
- Hinweis auf unterstützte Headsets
- VErbinden -> Bilder mit einheitlichen Nummern
-->
## pascom Client Training Videos

{{< youtube dZ6U_YShgag >}}
<br>
{{< youtube xATkFu9Qizk >}} 
<br>
{{< youtube 8OBSRSndjas >}} 

## Login

In to enable the added [user]({{< relref "/user/user#adding-users">}}) to login and use the pascom client, they will need their username and password.

|Field|Description|
|---|---|
|Username|username@instancename|
|Password|User password|
|Server|Domain or IP address of the server|
|Save login details?|Select the check box if your wish to enable the client to start automatically with the entered login credentials.|

{{% notice info %}}
Should you use a self-hosted "On-premise" phone system with only one instance, entering the @instancename component after the username is not necessary.
{{% /notice %}}

![Client Login](clientlogin.en.png?width=80%)

## Overview

The Desktop client consists of three main components:

+ On the left hand side of the client, you will find your profile section, UC tools menu and contact list.
+ The right hand side is dedicated to telephony functions
+ The middle section is a fluid content area that changes depending on which UC tool is currently being used, i.e. Instant Messaging (Chat), Call History or Phone Books.

![Client Expanded Mode](expanded_mode.en.png)

The desktop client also offers differing view modes:

+ **Expanded Mode**: Displays all three components, of which the middle section can be selected using the UC tool toggle list.
+ **Normal Mode**: The user profile and contacts are visible as well as it being possible to switch between the *Chats, Telephony, Call History,* and *Phone Book* tools.
+ **Mini Mode**: Only a single area is visible and the UC tools menu is now found under the content area. Using the menu tool, it is possible to navigate through all UC tools, changing the visible content area as you go.

![Client Normal and Mini Mode](normal_mini_mode.en.png)

In order to simplify switching the various views, it is possible to toggle the sizes using a [shortcut key]({{< relref "#shortcut-keys">}}) if you choose to.

## Profile and Contacts List

![My Profile](profile.en.png?width=90%)

|Function|Description|
|---|---|
|Presence Status|It is possible to update your presence status with the following options:<br>- *Green* > Available<br>- *Yellow* > Away<br>- *Red* > Do Not Disturb / Busy (This option doesn't deliver DND functionality.)<br><br>Status texts can be customised according to requirements - simply select the correct presence and then click on the status text and replace it.|
|Create new group|With the "+ symbol" you can create a new permanent team messaging / chat group.|
|Contact list filter|Filter contacts to display only certain contacts. Per default, two filters are available as standard - *Favourites* and *Teams*. Favourites can be added by clicking on the star symbol next to a contact's handset icon. Additional filters can be defined by the system administrator using [Roles]({{< relref "/user/role">}}).|
|Contacts |[Contact list]({{< relref "#Contacts">}}) displaying contact presence, extension and contact information.|
|Phone Symbol |Click on the phone symbol to call the contact.|
|Favourite Symbol|Simply mark your favourite contacts with the "star" symbol. These are then pinned at the top of the contact list.|
|Teams | Under [Teams]({{< relref "#teams">}}) you will see all the teams of which you are either a permanent or dynamic member. The *Available* or *Offline* status signify whether you are currently logged into a team or not.|


## Contacts

Each contact in your contact list has various statuses, which can be seen in the following illustration.

![Contacts](contacts.en.png?width=90%)

## Teams

![Teams](teams.en.png)

The teams function can be used to gain an overview of what's happening in the teams of which you are a member of. The teams tool also enables you to dynamically log in / out of a team (if your are a dynamic member), pause / resume your team membership as well as seeing the status of other team members / queue agents and seeing any calls currently waiting in the queue.

## Integrated Softphone

If your system admin has assigned a pascom softphone to your user account (default yes), then you can select your pascom softphone via the telephony settings menu.

![Softphone](softphone_audio.en.png?width=250px "pascom Softphone Audio Settings")

To use the softphone, you will need to configure the following softphone settings; Microphone, Speaker (Audio output) and Ringing speaker. Even if your desktop client has automatically detected your headset, you will need to select it from the drop down list. Should your headset not automatically appear in the list, then please check your computers audio.

## Choose a Location

You have the option of using the location function to use preconfigured setups, e.g. Home office PC with hardware telephone. If an administrator gives you the rights to log in and out of such a workspace, you can easily apply this setup to your user.


![Choose a location](workspace.en.png?width=500px)


You select one of the locations assigned to you and can now use the preconfigured telephone setup. This setting can also be found again in the Follow Me Settings of the Client Settings.

## Making Calls

### Training Video

{{< youtube xATkFu9Qizk >}}
  
Before you starting making calls, please check your telephone settings. Particularly if you have multiple telephones assigned to your user account, it is essential to ensure that the correct device is selected.

![Dialpad](dialpad.en.png?width=100% "pascom SIP Softphone")

### Start a Call

The desktop app offers numerous options for starting a call:

* Enter the number via the [Dialpad]({{< relref "#making-calls">}}).
* Call a colleague by clicking on the phone icon within the [Contact List]({{< relref "#contacts">}}).
* Click on the phone icon in the [Call History]({{< relref "#call-history">}}).
* Select a number from the [Phone Book]({{< relref "#phone-book">}}).

### Active Call

![Active Call](current_call.en.png?width=90%)

### Inbound Calls

![Inbound Calls](inbound_call.en.png?width=90%)

### Transfer

#### Blind Transfer (Unattended Transfer)

![Blind Transfer](blind_transfer.en.png?width=100%)

A blind or unattended transfer is a transfer of a call from one party to another without talking to the new contact during the transfer. A blind transfer can be performed at anytime during a call by clicking on the 'Transfer' icon and dialing the new destination number (number to which the call should be transferred).

If you wish to transfer the call to an internal colleague, simply right click on the desired colleague's name / profile picture in the contact list and select *Transfer* from the menu.

#### Attended Transfer

An attended transfer is a call transfer that involves speaking to the intended recipient before completing the transfer. To perform an attended transfer, please follow these steps:

1. Click *Add Participant*, to talk to the new party.
2. Now *Transfer* the caller with the newly added participant.

![Attended Transfer](attended_transfer.en.png?width=100%)

It is not necessary to place the caller on hold, as this is automatically done when the call to the new participant in step 1 is started either via the *Add Participant* button, the contact list, the phone book or via the call history logs. After completing step 2, the caller will be connected to the new party.


### 3-Way-Conferencing

![3-way-conferencing](3_way_conference.en.png)

A 3-way-conference is started in a similar fashion to an [Attended Transfer](/clients/client-user-guide/#attended-transfer) via a 2 step process.

1. Click the *Add Participant* button and call the required party.
2. To start a 3-way-conference simply click on the *Conference* button.

During a 3-way-conference call it is possible for the initiator to remove a party from the conference directly from the active calls list in the telephony section of the desktop app.

### Sending DTMF Tones

DTMF tones are used to enter information via the dialpad such as PIN authentication for conference rooms or when selecting the required choice in an IVR options menu (press 1 for..., 2 for ..., 3 for ... etc) or even having to enter a number code to open an intercom door for example.

For the pascom Client to send DTMF tones, the pascom softphone is required and the DTMF tones can be sent during a call via the *Dialpad*.

![DTMF](dtmf.en.png?width=500px)

## Search and Smart Filter

### Search

The pascom desktop client includes an extensive search tool which can be accessed via the search / magnifying glass icon. When searching, the search tool will search your internal contacts, all connected phone books, your call history and chat archive. The search term can consist of multiple terms / words.

![pascom client search](search.en.png)

*Example*: when searching for the contact *"Max-Andreas Mustermann"* the search term *"And Muster"* is sufficient.  

The search function can also be used in the dialpad to quickly find contacts for conferences or transfers.

![Search within dialpad](search_dialpad.en.png?width=250px)

### Smart Filter

Smart-Filters are a great tool to quickly filter your contact list for specific attributes or status, for example, who is currently online or just showing my favorites.

![Smartfilter](smartfilter.en.png?width=250px)

## Notifications

As soon as an event (call, message etc) occurs a popup notification will appear. These popup notifications provide additional information to the type of event i.e. caller name or chat contact name. The popups also allow users to react to the event without needing to go to the desktop client.

|Notification|Description|
|---|---|
|![Active Call](notification_outbound_call.en.png)|Popup indicating an active outbound call with the ability to end the call by clicking on the hangup icon.|
|![Active Call](notification_inbound_call.en.png)|Popup notification indicating an active inbound call with the ability to pick up via the green phone / pickup icon.|
|![Active Call](notification_active_call.en.png)|Popup indicating an active call with the ability to:<br>* hold the call via the pause symbol<br>* to end the call by clicking on the hangup icon.|
|![Active Call](notification_missed_call.en.png)|Popup notification indicating a missed call with the ability call back via the green call back button.|
|![Active Call](notification_chat.en.png)|Popup notification indicating a new chat message with the ability to respond direct from the popup.|

Via the settings menu, you can modify your notification settings:

![Notification Settings](notification_settings.en.png?width=500px)

## Groups

With the group function, it is possible to create permanent groups which deliver a number of additional functions.

1. Always - on Team Messaging / Group Chat
2. Audio Conference rooms
3. Video Conferencing
4. Online Meetings including Screensharing


### Create Groups

![Create group](group_create.en.png?width=100%)

In the contact list, click on the "+ symbol" to create a new group. You can create as many groups as you need. Next, enter an appropriate group name (i.e. sales or marketing), upload a group profile image and add the desired participants. Finally, save the group by clicking the "Floppy Disk" save symbol. The new group will now appear in your contact list. 

### Manage Groups

![Manage pascom collaboration group](group_manage.en.png?width=100%)

To manage a group, select and click on the required group within your contact list. To make changes to the group, click on the information symbol next to the group name and icon at the top of the content section. It is also possible to mute notifications for this particular group via the speaker icon (top right of the content section). In addition, you can make groups public by allowing **guest access**. Detailed instructions on public groups in connection with the WebClient can be found [here]({{<ref "clients/webclient-userguide">}}).

## Chat

There are 2 ways to start a chat conversation: by clicking on the desired person within the contacts list OR during a call and selecting the chat option from within the in-call menu.

![pascom Instant Messaging](chat.en.png?width=90%)

### Team Messaging / Group Chat

In order to use the team messaging / group chat tools, a group is required. If you have not yet created a group, first create a new [Group]({{< relref "#groups">}}).

![Group Chat](groupchat.en.png)

Click on the desired group in the contact list. Within the contect section of the client, all chat messages from the selected group will appear. To close the chat, simply click the "X" symbol in the upper right hand corner of the chat window. 

### Chat Notifications

Should the chat window not currently be active and you receive a new message, a green notifier will appear in the contact list next to the respective group / contact AND within your profile picture. The notifier within your profile picture represents all unread messages from all contacts / groups. Contacts with new messages will automatically move up to the top of the contact list, if you have set the list sorting to "recent".

![Multiple Chats](notification_newmessages.png?width=250px)


If your order is not set to automatically show the most recent activity at the top of the contact list, you can click on the number of unread messages within your profile picture. The smart filters will then only show the contacts that contain new unread messages.

![Multiple chats filtered](notification_newmessages_filtered.png?width=250px)

## File Transfers

The desktop client allows you to share files with your colleagues which can done via either one of the following three methods:

1. In an ongoing, active chat simply click on the paper clip symbol (bottom right of the chat area). This will allow you to select a file from your computer which can then be sent:
![File Transfer](file_transfer_1.en.png?width=500px)
2. In an active chat with a colleague, you can add the file to be transferred by drag and drop. Upon dropping the file will be sent:
![File Transfer](file_transfer_2.en.png?width=350px)
3. Should you not have an active chat open, it is possible to send a file to a colleague by dragging the file to the desired contact's profile listing in the contact list. Drop the file on the contact and the file will be sent:
![File Transfer](file_transfer_3.en.png?width=300px)

## Group Conferences

It is often the case, that you may have to quickly and effectively collaboration with your colleagues on the fly. In order prevent conference room login, availability and scheduling issues, the pascom client includes a group audio conferencing tool.

To start a group audio conference, a group is required. If you have not yet created a group, first create a new [Group]({{< relref "#groups">}}).

### Start/Join Group Conferences

To start or join a group conference, simply call the desired group. The system will provide you with all the relevant information about the conference, just like in a conference room.

![Start Group Conference](group_conference_start.en.png?width=300px)

If there are already colleagues in a group conference, this is indicated within the client by highlighting the group in green within the contact list. You can easily join the audio conference by calling the group.

![Group Conference Notification](group_conference_notification.en.png?width=300px)

### Active Group Conferences

During a group conference, a number of additional functions will become available.

1. Group Chat
2. Switch to Video Session
3. Start Screensharing

You can leave the Group Conference by clicking the red hangup button.

![Active Group Conference](group_conference_active.en.png?width=95%)

## Video and Screensharing

### Video Telephony

During a call, you can easily elevate a call to a video conference as long as a webcam is available. To check whether your webcam is correctly configured, please go to the client settings.

![Start Video Call](video_start.en.png?width=300px)

By default, video calls start in full screen mode.

![Active Video Call](video_active.png?width=95%)

By clicking the chat icon, the current chat or group chat (depending on with whom you are calling) will open. 

The video menu includes the following options:

![Active Video menu](video_options.png?width=250px)

|Option|Description|
|---|---|
|Hang Up| Ends the complete call.|
|Video on/off|start/stop the video call and returns to a normal audio call.|
|Screensharing on/off|start/stop Screensharing.|
|Fullscreen off|Minimizes the fullscreen and integrates video / screen sharing into the content area of ​​the client.|
|More options (3 Dots)|Expands the menu.|
|DTMF Dialpad|Shows the dialpad.|
|Mute on/off|Turns the microphone on / off.|
|Change Camera|Switchs the active camera from front to back - only on Mobile Devices.|

When you exit full-screen mode, the active video / screen sharing call is minimized and integrated into the client. From there you can access all your usual client functions. Of course, you can also switch back to full-screen mode with the buttons below the video window.

![Active Video minimized](video_active_minimized.en.png)

### Screensharing

During the call, you can share your screen content with your conversation partner by clicking on the screen sharing button.

![Start Screensharing](screensharing_start.en.png?width=300px)

By default, screen sharing sessions start in fullscreen mode. You have the same [Options]({{< relref "#video-call">}}) as with a video call. 

![Active Screensharing Session](screensharing_active.png)

### Video Call and Screensharing

During a [Video Call]({{< relref "#video-telephony">}}) you can simultaneously share your screen with other members on the call. Simply click on Start Screen Sharing in the menu. 

![Start screensharing during a Video Call](video_options_startscreensharing.png?width=250px)

The video stream will then be automaticly minimized and makes room for the screen content of the caller. Again, all the usual [options]({{< relref "#video-call">}}) are available again.

![Video Call with screensharing](video_screensharing_fullscreen.png)

## Audio/Video groups with Screensharing

The basis for these team collaboration tools is a group.. If you do not have a group yet, you need to create a new [group]({{< relref "#groups">}}) first.  

Start a new [group conference]({{< relref "#group-conferences">}}) or join an existing group conference. Now you can use the [video]({{< relref "#video-call">}})- and [screensharing]({{< relref "#screensharing">}}) feature with multiple conference participants.

![Group Video Screensharing Conference](group_video_screensharing_conference.png)

## Call History

The Call History provides an overview of all your calls.

![pascom Call History](journal.en.png)

By using the right click function, it is possible to use the following when clicking on a call in the log:

* Copy all details pertaining to a caller (Time, type of call, caller name (if available), and their phone number),
* Copy only the phone number to store or edit elsewhere,
* Send the number to the dialpad

![phone number](journal_rightclick.en.png?width=250px)

## Telephone Book

![pascom Telephone book](phonebook.en.png)

The client provides access to the company phone book as well as your private phone book which you can manage yourself. Add a contact to the private phone book and this display name will displayed by incoming calls but only in your desktop client.  

If you want to add external contacts from your phonebook to the contact list, you can mark the corresponding contact as a favourite in the phonebook.

![phonebook](phonebook_favorit.png?width=350px)

## Fax

![pascom client fax](fax.en.png?width=500px)

If a fax number is already stored in the phone book, it is possible to send a fax by clicking on the fax symbol in the phone book:

![Fax](phonebook_fax.en.png?width=350px)

### Fax from a watched folder (PDF to Fax)

The Client Settings > {{< ui-button "PDF to FAX settings" >}} allows you to define a folder on your computer. This folder is monitored by the client. As soon as a PDF File is saved, copied or printed in this folder, the pascom client opens the fax dialog to send this file.

### Automatic fax via a watched folder

Fax control panels are inserted as plain text in the document to be sent, then the fax server processes these instructions.

#### Preparation

To be able to recognize the panels from the PDF document, the [Ghostskript](https://www.ghostscript.com/) is needed on your machine. If the ghostscript is installed then the path of the Ghostscript File *gs* must be selected via the client > {{< ui-button "PDF to FAX settings" >}}.


#### Automatic transmission

Insert the controls into the document to be sent.

Please note that these panels can also be read by the recipient. Possibly, you can be invisible with certain writing programs (eg white test on a white background).

|Available controls||
|---|---|
|@@+FAX:+49991123456789@@|The fax must contain at least this control character with the destination number.|
|@@+TAG:Bestellung XYZ@@|Optionally, the fax job can be provided with a subject.|
|@@+NOTIFY:mustermann@musterfirma.de@@|Optionally, you can specify who should be notified of the status of the fax job.|


As described in the previous section, you can use the client settings > {{< ui-button "PDF to FAX settings" >}} to define a folder on your computer that is monitored by the client. As soon as a PDF file is saved, copied or printed in this folder, the control fields are evaluated and the file is sent as a fax.

## Call Voicemail

![Voicemail-Box](voicemailbox.en.png?width=500px)

By clicking on the Voicemail box symbol, it is possible to call your voicemail box directly. Additional options can be configured by following the prompts in the voicemail system itself.

## Shortcut Keys

{{% notice info %}}
Shortcut keys are only available in the desktop client for Windows and macOS.
{{% /notice %}}

When installing the client, the shortcut keys are predefined. However, if needed the shortcut keys can be freely customised according to your preference.

![Shortcut keys](settings_shortcuts.en.png?width=90%)

### Global Shortcut Keys:

|Shortcut Key|Description|
|---|---|
|Smart On / Off Hooking |Enables incoming call pickup via shortcut key, even when the client is not the active window.|
|Click-to-Dial|Enables dialing a number direct from a browser or document by highlight and pressing the shortcut keys.|
|Toggle Window|This function enables either bringing the client to the foreground or to minimise the client via a shortcut key.|

## Client Settings

You can access the client settings by clicking on the gear-symbol in the menu bar.

![Client Einstellungen](Menu_single.png?width=200px)

### Profile Settings

![profile settings](profilesettings.en.png?width=45%)

|Setting|Description|
|---|---|
|Avatar|Change your profile picture. Autogenerate a profile picture or upload a profile picture from the computer.|
|Contact List|Sort your contact list according to your application preferences.|
|List Style|There are 2 contact list styles available. "List view" for a narrow contact list and "Details" for a more detailed view.|
|Auto Away|If your computer is not locked and your mouse does not move for XXX seconds, your status will change to yellow "I'll be right back"|
|Journal / Hide System Calls|Hides system calls like voicemail etc. from the journal.|
|Change Password|Set a new Password - works only if the password is not set from an  external source (for example Active Directory)|

### Call forwarding

To set up call forwardings, enter the desired number in the field. After a click, it is set and active. To deactivate, click on the red X symbol next to the phone number. If configured by the administrator, you can click on the input field to find a drop-down menu in which predefined call diversions are stored.

![Rufumleitungen](redirection.en.png?width=400px)

### Audio and Headset Settings

Headset settings for supported manufacturers Sennheiser, Jabra and Plantronics. These should be set to "auto" to ensure a fast hardware detection of connected devices. Adjust the microphone, speakers and ringtone of the connected headsets.

![audio and headset settings](audiosettings.en.png?width=400px)

### Kuando Busylight Settings

The pascom system supports the use of the Kuando Busylight. The pascom client automatically recognises the connected Kuando Busylight and configures it. Alternatively, you can switch from **AUTO** to **IGNORATE**, which means that the Kuando Busylight is not used in the pascom client. 

![Kuando Busylight Setup](kuando.en.PNG?width=450px)

### My Devices

In the Follow Me Settings you decide yourself, providet that it has been activated by the administrator, which of your devices should ring. In addition, you can select predefined workstations to which you can login.

1. Determine your device that will be used for outgoing calls.
2. Determine which of your devices should ring when. 
3. Pair / unpair your mobile device. 

![Follow Me Settings](followme.en.png?width=95%)

### Client Settings

Here you define the basic settings of the Client.

1. Change the Language.
2. Choose between 2 Colormodes, bright and dark.
3. Determine a download folder in which the files of transfers are stored. 

![Client Settings](client_settings.en.png?width=500px)

## Actions

{{< youtube pyVqJ5SKIIk >}} 

The actions allow you to pass call data to third-party applications. Here you have the possibility to pass on data to a URL or to an installed application.

![Client Actions](actions.en.png?width=500px)

The applications are diverse here. You can use the variables $ {name}, $ {number}, $ {MDC_LABEL-X} or $ {MDC_SKILL-X} (Labels) as parameters.

|Setting|Description|
|---|---|
|URL|Enter the URL here, followed by the desired parameters.|
|Automaticly open URL|Automatically open URL on incoming call.|
|Application|Select the installed application on your computer here.|
|Parameters|Define here the parameters to be passed to the application.|
|Automaticly open app|Application starts automatically on incoming call.|


## pascom Client Feedback  

Should you discover an issue / problem with your client, you can view detailed info via the Open Client Logs button in the Settings menu. Should you wish to report a bug, please send the  *Support-Info* ZIP file to us.

![About](about.en.png?width=45%)
