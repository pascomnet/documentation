---
title: pascom Client
description: pascom phone systems include native clients for Windows, MacOS, Linux, iOS and Android
weight: 990
---

{{% notice tip %}}
For further information, please refer to our detailed [Client documentation]({{< ref "/clients" >}}).
{{%/notice%}}


## Release 44.D54

**Overview**

- Updated Plantronics Headset Library to the latest version
- The iOS-App now gets calls via push more reliable
- The GSM-Switch now keeps it’s state reliably

**ÄNDERUNGEN:**

* [CL-10] - Adapt tooltip in client to current state
* [CL-15] - Do not acknowledge chat message if received in settings menu
* [CL-27] - Message counter broken with pascom client and LTS
* [CL-35] - Can’t close permanent group chat in macOS client
* [CL-53] - Update plantronics spokes sdk in client to the latest version
* [CL-62] - Pickup waiting callers via ‘Calls Waiting’ list
* [CL-64] - Do not allow Update Channel Switching if user has no permission to update client
* [CL-65] - Duplicate error message if voip is disabled on the proxy
* [CL-71] - pascom Client tel callto and sip uri handlers don’t work if the numbers have spaces
* [CL-92] - Audio doesn’t work on windows 10 after upgrade 1803
* [CL-95] - iOS App still misses some calls
* [CL-97] - Contact list / roster filter is not correctly restored on startup
* [CL-168] - Show Team Call names in iOS Client and improve name generation
* [CL-236] - Mobile application displays “Login failed” screen, but logs in sucessfully
* [CL-238] - GSM Switch is still unreliable and activates itself
* [CL-240] - Sort trunk dropdown in client
* [CL-255] - Make settings scrollable on whole width
* [CL-259] - Android client crashes very often with “Illegal State Exception”
* [CL-283] - Android has incorrect version name


## Release 42.R34 (17.10.2018)

**Overview**

- Integration for Android contacts
- Integration for macOS and iOS contacts
- Improved Sennheiser headset Support
- Improved reliability of attended transfer on iOS

**MODIFICATIONS:**

* [CL-23] - Improve behavior of shortcut settings in client
* [CL-34] - Headset buttons on Plantronics D100 not working with macOS
* [CL-37] - Right click in chat binds menu to cursor
* [CL-42] - Multiple dials after long click-to-dial shortcut press
* [CL-43] - Improve input validation for phonebook editing in client
* [CL-47] - Inconsistent behavior of xmpp groups and teams in classic and pascom client
* [CL-86] - Client reconnects after sending special character
* [CL-88] - client crash in SingleChat::unreadMessages()
* [CL-104] - Client phonebook search provider should also search incomplete numbers
* [CL-108] - Sennheiser Headset stays in call if call is accepted simultaneously by another user
* [CL-121] - Include dump files during creation of Support Information in client
* [CL-125] - Check and upgrade to pjsip release 2.8
* [CL-133] - Detect and prevent installing on unsupported windows Versions
* [CL-145] - Integrate Apple macOS/iOS Address Book in Client
* [CL-149] - Show a toast if the device changes after switching the location
* [CL-152] - Message counter in close button on mobile
* [CL-163] - Android Phonebook Integration
* [CL-172] - Add "Load older messages" button to chat view
* [CL-220] - Multi-Line chat messages are not possible anymore in pascom client
* [CL-221] - Client tray icon translation sometimes doesn't work
* [CL-222] - Wrong contact details in chat history
* [CL-223] - Prohibit inconsistent phonebook entries of users
* [CL-224] - Improve fax dialog
* [CL-225] - No hint if softphone is not ready
* [CL-226] - "preferred device" toast is shown also on mobile
* [CL-227] - Create High-Resolution Versions for Phonebook Icons
* [CL-228] - Show hint that sennheiser activation failed
* [CL-245] - No audio after transfer of external call to ios mobile client

