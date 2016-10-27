---
title: Conference Room System
url: /modules/conference-system/
prev: /modules/call-recording/
next: /modules/cluster-setup/
weight: 93
toc: true
---

## Concept
If more than three people want to communicate with each other simultaneously, virtual conference rooms can be used.

A conference room is reachable under an extension number and in order to enter the conference room, simply dial the extension number and enter the required PIN number. 

If the extension number belongs to block of numbers (otherwise known as DIDs - Direct Inward Dial) from a voice Trunk, then the conference room will also be externally accessible.
//FixMe
![Illustratiom - VoIP Conference Rooms](../../images/conference_meetme.png?width=90% "VoIP Conference Room System")

## Configuration
In the mobydick Commander web User Interface, select Users > Conference room and press the "Add"//FixMe button.
![Screenshot - configure conference room in mobydick](../../images/conference_meetme.png?width=90% "configure conference room")

|Parameter|Description|
|---------|---------|
|Title|Conference room name|
|Extension|    The extension for the conference room|
|Message   |Whether a conference attendee has to speak their name before entering the room. The name will be announced to all other attendees as soon as that person enters or leaves the room. This helps to keep track especially in larger conference rooms.|
|Music on hold|If there is only a single attendee, music on hold can be played to that person. To learn how to create your own playlist, please see Custom Prompts and Music On Hold.|
|Password  |The PIN that is necessary to enter the room. //FixMeBeim Anlegen des Konferenzraumes wird automatisch eine PIN generiert, diese kann vom Administrator geändert werden. Das Passwort kann mit dem Button "Passwort anzeigen/verbergen" angezeigt oder verborgen werden.|
|Options| The Confbridge Options can be added here|
