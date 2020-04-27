---
title: Web Client User Guide
description: This User Handbook explains how to use the pascom Web Client.
weight: 30
---

{{< doctype "both" >}}

{{< description >}}


{{% notice tip %}}
The pascom Web Client does not replace the pascom desktop or mobile client, but enables communication with external participants in web conferences via the web browser.
{{% /notice %}}

## pascom Training Video
Comming soon!


## Supported Browsers

The pascom Web Client can be used in your favourite web browser. Currently, popular browsers such as Chrome, Firefox, Safari and Microsoft Edge are supported.

![Supported browsers](browser_logos.png?width=50%)

## Overview

The pascom Web Client has been design to enable quick, easy and professional audio and video conferences accessible to external participants. Thanks to WebRTC technology the pascom Web Client provides your employees and customers with the ability to participate in web conferences and presentations from anywhere. The concept is easy to understand, simply make your existing pascom Team Messaging Groups externally accessible and invite your customers, business partners etc. to join your online meetings.

### What's required?

- pascom Desktop or Mobile Client  
- pascom Team Messaging Group  
- A Moderator  
- External participants   

![Overview](webclient_overview.en.png?)

## pascom Groups

Groups in pascom provide an excellent Team Collaboration tool where you can quickly and dynamically create a place for people to communicate and collaborate with one another. pascom groups can be used for a wide variety of purposes, such as projects, presentations and conferences. Imagine pascom groups like virtual conference rooms.

### Create a pascom Group

First you will need a pascom group. Create a new group using the following [Instructions]({{< ref "clients/desktop-userguide#groups">}}). Tip: There are no limitations on how many groups you can create, so you can add as many groups as you like / require on the pascom system.

### Make pascom Groups Public

In order to grant external participants access to a group, the group must be made public. The **info symbol** of a group takes you to the administration settings. Switch the **Allow guests** button **on**. The group is now public. This is also shown in the contact list for the respective group.


![pulic groups](groups_public.en.PNG?width=70%)

You now receive a **dial-in number, PIN and URL** for the web client.


|Fields|Description|
|---|---|
|Dial-in-Number|Participants can take part in the conference by phone via the WebClient by dialing the dial-in number.|
|PIN|The PIN is required to participate in the conference using the dial-in number.|
|URL|Link to the group in the web client.|
|Copy Invitation to Clipboard| Copy all details clearly to the clipboard to share all important data with external participants.|

{{% notice tip %}}
As soon as a group is public, external participants can log in to the group using the dial-in data. But don't panic, only moderators can actually start web conferences.
{{% /notice %}}

### Setup Dial In Number

In order for your participants to be able to attend a conference using the dial-in number, you must set the **external group number** on the Admin GUI. You can find this setting under ({{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} > {{< ui-button "Telephony" >}}).

![Setup Dial in Number](set_number.en.PNG?width=60%)

As with classic conference rooms, reserve a telephone number for your physical Trunk and set this up with the external group number. All groups now use the same dial-in number for external dial-in.

{{% notice tip %}}
Are you wondering how one dial-in number should work for all groups? The pascom system generates a unique PIN for each group. This way, the telephone system knows to which group / conference an external participant wants. Think of it like a hotel lobby.
{{% /notice %}}

If the **external group number** is not set, the feature for participating in conferences via the dial-in number is missing.

![Keine Einwahlnummer](no_number.en.PNG?width=80%)


## The Moderator

Internal users of the pascom system are referred as moderators. Every internal user who participates in a public conference is also a moderator. If a moderator dials into a public conference, it starts for all externally logged in participants. If the last moderator leaves a public conference, the conference is set to **hold**.
As soon as external participants log into a conference and wait for the conference to start, you will see this in the contact list for the relevant group. The group will then turn green.

![Group in Contact List](contactlist.en.PNG?width=40%)

{{% notice tip %}}
Several internal users can also participate in a web conference, all of them then act as moderators. Hold a presentation and let another users answer questions in the chat at the same time.
{{% /notice %}}

### Start a Conference

As soon as you are ready to start the web conference, join the group by dialing in with the **handset symbol**. 

### Manage a Conference

As a moderator, you have full control over the conference. In the call area you can see all participants in the conference and can interact with them. You still have all the phone and video tools you need to give great online meetings or presentations. 


![participants](participant_list.en.PNG?width=80%)

You can still use the chat function with all participants and manage settings for the group.

![Chat](contentview_during_conference.en.PNG?width=80%)

### Remove Participants

You can remove individual participants from the conference using the **info symbol** of the group. Simply click on the **trash symbol** of the participant you want to remove. The conference is then ended for this participant.



![Remove Participant](participant_remove.de.PNG?width=80%)

### Close a Conference

You have the option of ending a conference at different points in the desktop or mobile client. In the content or call area, click on the **red handset symbol** to leave the conference. 

{{% notice tip %}}
The web conference is not completely ended. External participants are directed to a waiting screen. So after a short break you can restart the web conference again.
{{% /notice %}}

## Participate in Conferences

pascom groups are a powerful conference tool which enable classic audio conferences and video conferences via the web browser.

### Join a classic Audio Conference

{{% notice tip %}}
For this, the public group must be configured with an **external group number**!
{{% /notice %}}

As an external participant in an audio conference, you will usually receive dial-in data consisting of a phone number + PIN.

```
Dial in Number: +499912969166
PIN: 313 787 136

```
As soon as you have dialed in via the dial-in number and entered the PIN, the pascom system will direct you to the corresponding conference. To end the audio conference, simply hang up.


### Participate in a Web Conference

As an external participant in a web conference, you will usually receive invitation data, that can look like this.

```
Group: "Demo Gruppe"
Webclient URL: https://pascom.net/pascom/webclient/f791b39a-4fd4-431b-850a
Dial in Number: +499912969166
PIN: 313 787 136

```
Surf to the web client URL with your browser and you will get to the start page of the web client.

![Webclient Startpage](webclient_startpage.en.PNG?width=100%)

Enter a name with which you want to participate in the web conference. This name will also be shown to all other participants. 

### The Web Client Options

![Webclient Options](webclient_options.PNG?width=100%)

**Choose Video**  

Your browser will automatically find installed webcams to participate in the web conference via video. Of course you can also deactivate the video function via the **DropDown menu**. 

**Audio through the Browser**  

Set the audio for the microphone and speakers here. The browser finds all installed devices such as, integrated components, headsets and headphones. Simply select your preferred end devices from the **DropDown menu**.

**Audio through the Phone**  

Change the tabs from browser to **Phone** to join the web conference by phone. Here you need the **dial-in number** and **PIN** to receive the audio via your phone.

### The Waiting Area

The waiting area always appears when no moderator has started the web conference or has chosen to pause from the conference.

![Webclient Wating Area](webclient_waiting.en.PNG?width=60%)

External participants can hear the music on hold set in the pascom system for the duration of their stay. The **Exit symbol** takes you back to the Web Client options.

### The Web Client Interface

As soon as the web conference has started, you will be taken to the web client interface, where you as a participant can use several options.

![Webclient GUI](webclient.PNG?width=100%)

**Video Areas enlarge/reduce**  

Each video area can be enlarged with a click and brought into focus. Click again to reduce the size. This is particularly helpful if you e.g. want to see more details in the screen sharing video.

**Chat Area**  

On the left side you will find the menu for the chat, which you can show or hide. Here all participants can ask questions or talk to each other.

**Participant List**  

On the right-hand side you will find the menu for the participant list, which you can show or hide. Here you will find all participants in the web conference.

**Toolbar**  

In the lower area you will find the toolbar. Here you can activate/deactivate your **microphone**, activate/deactivate **video sharing**, switch to **fullscreen mode** and leave the conference.

### Leaving the Web Conference

If you leave the web conference with the **Exit symbol**, you will return to the client options. From here, you can attend the web conference again or close the browser window.











