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

Coming soon!

## Supported Browsers

The pascom Web Client can be used in your favourite web browser. Currently, popular browsers such as Chrome, Firefox, Safari and Microsoft Edge are supported.

![Supported browsers](browser_logos.png?width=50%)

## Licensing

In order to use the pascom WebRTC Client, a concurrent user license is required for each external participant. Therefore, make sure that there are sufficient licenses available before starting a web conference.

{{% notice tip %}}
If you would like to find out more about our flexible concurrent user license model or upgrade your existing licenses, please contact our sales department. Further information can be found on our pricing [license description](https://www.pascom.net/en/voip-prices/) page.
{{% /notice %}}

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

In order to provide external participants access to a group, the group must be made public. Click the **info symbol** within the group which will take you to the administration settings. Switch the **Allow guests** button to **on** in order to make the group "public". This "public" status will also be displayed respective group's entry in the contact list.

![pulic groups](groups_public.en.PNG?width=70%)

A **dial-in number, PIN and URL** for the pascom WebRTC web client access will now be generated and displayed.


|Fields|Description|
|---|---|
|Dial-in-Number|Participants can access the conference by phone using the pascom Web Client's dial-in number.|
|PIN|The PIN is required to participate in the conference using the dial-in number.|
|URL|Link to the pascom Web Client to access the group web meeting.|
|Copy Invitation to Clipboard| Copy all details to the clipboard for sharing all access information with the intended participants.|

{{% notice tip %}}
As soon as a group is public, external participants can log in to the group using the dial-in / access data. But don't panic, only moderators can actually start web conferences.
{{% /notice %}}

### Setup Dial In Number

In order for your participants to be able to attend a conference using the dial-in number, you must configure an **external group number** in the admin web UI. To do this, go to ({{< ui-button "Appliance" >}} > {{< ui-button "Services" >}} > {{< ui-button "Telephony" >}}).

![Setup Dial-in Number](set_number.en.PNG?width=60%)

As with classic conference rooms, reserve an available telephone number from your SIP trunk number block / DIDs (Direct Inward Dials) and configure it as the external group number. All groups will now use the same dial-in number for external dial-in.

{{% notice tip %}}
Wondering how one dial-in number should work for all groups? The pascom system generates a unique PIN for each group. This way, the telephone system knows which group / conference an external participant wants to access.
{{% /notice %}}

If the **external group number** has not been configured, the feature enabling conference participation via dial-in will be missing.

![No dial-in number](no_number.en.PNG?width=80%)

## The Moderator

Internal users of the pascom system are referred as moderators. Every internal user who participates in a public conference is also a moderator. If a moderator dials into a public conference, the conference will automatically start for all externally logged in participants. If the last moderator leaves a public conference, the conference will then be set to **hold**.
As soon as external participants log into a conference and wait for the conference to start, you will see this in the contact list for the relevant group as the group will turn green.

![Group in Contact List](contactlist.en.PNG?width=40%)

{{% notice tip %}}
Several internal users can also participate in a web conference, all of them acting as moderators. For example, when holding a presentation you can let other moderator users answer questions in the chat at the same time.
{{% /notice %}}

### Start a Conference

As soon as you are ready to start the web conference, join the group by dialing in by clicking the green **phone symbol**. 

### Manage a Conference

As a moderator, you have full control over the conference. In the call area you can see all participants in the conference and can interact with them. You still have all the phone and video tools you need to give great online meetings or presentations. 

![participants](participant_list.en.PNG?width=80%)

You can still use your pascom chat tools to chat with  all participants and manage settings for the group.

![Chat](contentview_during_conference.en.PNG?width=80%)

### Remove Participants

You can remove individual participants from a conference using the group **info symbol**. Simply click on the **rubbish bin symbol** next to the participant you want to remove and the conference will then end for this participant.

![Remove Participant](participant_remove.de.PNG?width=80%)

### Ending a Conference

With the pascom desktop client of mobile app, there are a number of options for ending a conference. In the content or call area, press the **red phone symbol** to leave the conference. 

{{% notice tip %}}
This will not completely end the web conference, but rather places it on hold. External participants will be directed to a waiting screen. So after a short break, you will be able to restart the web conference again.
{{% /notice %}}

## Participate in Conferences

pascom groups are a powerful conference tool which cn be used to enable both classic audio conferences and modern video conferences via the web browser.

### Join a Classic Audio Conference

{{% notice tip %}}
To use this option, the public group must be configured with an **external group number**!
{{% /notice %}}

As an external participant in an audio conference, you will usually receive dial-in data consisting of a phone number and PIN.

```
Dial in Number: +499912969166
PIN: 313 787 136

```
As soon as you have dialed in via the dial-in number and entered the PIN, the pascom phone system will direct you to the corresponding conference. To end the audio conference, simply hang up.

### Participate in a Web Conference

As an external participant in a web conference, you will usually receive an invitation that can look like similar to below.

```
Group: "Demo Group"
Webclient URL: https://pascom.net/pascom/webclient/f791b39a-4fd4-431b-850a
Dial in Number: +499912969166
PIN: 313 787 136

```
Enter the URL into to your browser and navigate to the pascom web client's web conference start page.

![Web Client Start page](webclient_startpage.en.PNG?width=100%)

Enter a name with which you want to join the web conference. This name will also be visible to all other participants. 

### The Web Client Options

![Web Client Options](webclient_options1.en.png)

**Select Camera**  

Your browser will automatically search for and find installed webcams which can be used when participating in a video web conference. It is of course also possible to disable the video function via the **drop down menu** and selecting **no camera**. 

**Browser Audio**  

Select and configure your audio preferences for both your microphone and speaker. Your browser will automatically try to detect installed devices such as integrated audio components, headsets and headphones. Simply select your preferred audio device from the **drop down list**.

**Phone Audio**  

To join a conference using dial-in phone audio you will need to select the **phone tab** within your the webclient log in browser window. You will need the conference **dial-in number** and **PIN** in order to call in and use your phone audio.

### The Waiting Area

If a participant joins a web meeting before a moderator has started the conference, the waiting area will always appear. This is also the case if a moderator chooses to pause a conference.

![Webclient Wating Area](webclient_waiting.en.PNG?width=60%)

External participants will hear the music on hold set in the pascom phone system for the duration the wait before the conference starts / resumes. The **leaver (exit door) symbol** takes you back to the Web Client options.

### The Web Client Interface

As soon as the web conference starts, all external participants will move to the web client interface, where as a participant several conferencing and collaboration tools will be available to you.

![Webclient GUI](webclient.PNG?width=100%)

**Increase / Reduce Video Size**  

By clicking on a participants video, it is possible to maximise the size of their video as the main point of focus. To decrease the video size, simply click it again. This function is especially helpful for maximising screen sharing video streams for maximum detail.

**Chat Area**  

On the left of the screen, you will see the chat menu icon which you can click to show or hide the instant messaging section. Within the chat area, each conference participant can chat with each other.

**Participant List**  

On the right of the screen, you will find the the participant menu icon which you can click to which you can show or hide the conference participant list.

**Toolbar**  

In the bottom section of the screen, you will find the conference toolbar in which it is possible to mute / unmute your **microphone**, turn your **video** on or off, switch to **fullscreen mode** and leave the conference.

### Leaving the Web Conference

If you leave the web conference using the **Leave (exit door) symbol**, you will return to the client options. From here, you can re-enter the web conference again or close the browser window.











